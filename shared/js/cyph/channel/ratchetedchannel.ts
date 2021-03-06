/// <reference path="channel.ts" />


module Cyph {
	export module Channel {
		/**
		 * Identical functional behaviour to Channel, except
		 * it automatically ratchets SQS IDs and regions.
		 *
		 * Ratcheting steps:
		 * * Alice: create new Channel; send descriptor over current Channel.
		 * * Bob: join new Channel.
		 * * Both (on newChannel onconnect): deprecate old Channel; wait a bit; destroy old Channel.
		 */
		export class RatchetedChannel implements IChannel {
			private lastChannelRatchet: number	= 0;

			private isConnected: boolean;
			private isCreator: boolean;
			private channel: Channel;
			private newChannel: Channel;

			private destroyCurrentChannel () : void {
				if (this.newChannel) {
					const oldChannel: Channel	= this.channel;
					this.channel				= this.newChannel;
					this.newChannel				= null;

					if (oldChannel) {
						setTimeout(() => oldChannel.close(), 150000);
					}
				}
			}

			private ratchetChannels (init: boolean, channelDescriptor: string = Channel.newDescriptor()) : void {
				if (this.newChannel) {
					return;
				}

				/* Block ratchet from being initiated more
					than once within a five-minute period */
				const last: number		= this.lastChannelRatchet;
				this.lastChannelRatchet	= Date.now();

				if (init && this.lastChannelRatchet - last < 300000) {
					return;
				}

				this.newChannel		= new Channel(channelDescriptor, {
					onopen: init ?
						() => this.session.send(
							new Session.Message(
								Session.RPCEvents.channelRatchet,
								channelDescriptor
							)
						) :
						() => {}
					,
					onconnect: () => this.destroyCurrentChannel(),
					onmessage: this.handlers.onmessage,
					onlag: (lag: number, region: string) => {
						if (!this.isCreator) {
							this.ratchetChannels(true);
						}

						Analytics.main.send({
							hitType: 'event',
							eventCategory: 'sqslag',
							eventAction: 'detected',
							eventLabel: region,
							eventValue: lag
						});
					}
				}, undefined, this.session);
			}

			public close (callback?: Function) : void {
				for (const channel of [this.channel, this.newChannel]) {
					try {
						channel.close(callback);
					}
					catch (_) {}
				}

				this.channel	= null;
				this.newChannel	= null;
			}

			public isAlive () : boolean {
				return [this.channel, this.newChannel].
					map(channel => {
						try {
							return channel.isAlive();
						}
						catch (_) {
							return false;
						}
					}).
					reduce((a, b) => a || b, false)
				;
			}

			public receive (
				messageHandler?: (message: string) => void,
				onComplete?: Function,
				maxNumberOfMessages?: number,
				waitTimeSeconds?: number,
				onLag?: Function
			) : void {
				Util.retryUntilComplete(retry => {
					try {
						this.channel.receive(
							messageHandler,
							onComplete,
							maxNumberOfMessages,
							waitTimeSeconds,
							onLag
						);
					}
					catch (_) {
						if (this.isAlive()) {
							retry();
						}
					}
				});
			}

			public send (
				message: string|string[],
				callback?: Function|Function[],
				isSynchronous?: boolean
			) : void {
				if (!this.isConnected) {
					setTimeout(() => this.send(message, callback, isSynchronous), 250);
					return;
				}

				Util.retryUntilComplete(retry => {
					try {
						this.channel.send(message, callback, isSynchronous);
					}
					catch (_) {
						if (this.isAlive()) {
							retry();
						}
					}
				});
			}

			/**
			 * @param session
			 * @param channelName Name of this channel.
			 * @param handlers Event handlers for this channel.
			 * @param config SQS configuration.
			 */
			public constructor (
				private session: Session.ISession,
				channelName: string,
				private handlers: ({
					onclose?: (err: any, data: any) => void;
					onconnect?: () => void;
					onlag?: (lag: number, region: string) => void;
					onmessage?: (message: string) => void;
					onopen?: (isCreator: boolean) => void;
				}) = {},
				config: any = {}
			) {
				const onopen: Function		= Util.getValue(handlers, 'onopen', () => {});
				const onconnect: Function	= Util.getValue(handlers, 'onconnect', () => {});

				handlers.onopen		= (isCreator: boolean) : void => {
					this.isCreator	= isCreator;

					/* Ratchet channels immediately after creation,
						then every 10 - 20 minutes thereafter */
					if (!this.isCreator) {
						Util.retryUntilComplete(retry => {
							if (this.isAlive()) {
								this.ratchetChannels(true);
								setTimeout(retry, Util.random(1200000, 600000));
							}
						});
					};

					onopen(this.isCreator);
				};

				handlers.onconnect	= () => setTimeout(
					() => {
						this.isConnected	= true;
						onconnect();
					},
					Env.isLocalEnv ? 2500 : 250
				);

				this.channel	= new Channel(channelName, handlers, config, this.session);



				this.session.on(Session.RPCEvents.channelRatchet,
					(channelDescriptor: string) => this.ratchetChannels(false, channelDescriptor)
				);
			}
		}
	}
}
