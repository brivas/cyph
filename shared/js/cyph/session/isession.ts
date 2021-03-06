module Cyph {
	export module Session {
		/**
		 * Encapsulates an end-to-end encrypted communication session.
		 * This is the entire non-UI representation of a cyph.
		 * @interface
		 */
		export interface ISession {
			/** State of the cyph (referenced by UI). */
			state: {
				cyphId: string;
				sharedSecret: string;
				isAlive: boolean;
				isCreator: boolean;
				isStartingNewCyph: boolean;
				wasInitiatedByAPI: boolean;
			};

			/**
			 * This kills the cyph.
			 * @param shouldSendEvent If true, before closing, will
			 * send a message telling the other guy that it's over.
			 */
			close (shouldSendEvent?: boolean) : void;

			/**
			 * Remove event listener.
			 * @param event
			 * @param handler
			 */
			off (event: string, handler: Function) : void;

			/**
			 * Add event listener.
			 * @param event
			 * @param handler
			 */
			on (event: string, handler: Function) : void;

			/**
			 * Receive incoming cyphertext.
			 * @param data Data to be decrypted.
			 */
			receive (data: string) : void;

			/**
			 * Send at least one message through the session.
			 * @param messages
			 */
			send (...messages: IMessage[]) : void;

			/**
			 * Send at least one message through the session.
			 * @param messages
			 */
			sendBase (messages: IMessage[]) : void;

			/**
			 * Shorthand for sending a user-facing chat message.
			 * @param text
			 */
			sendText (text: string) : void;

			/**
			 * Trigger event, passing in optional data.
			 * @param event
			 * @param data
			 */
			trigger (event: string, data?: any) : void;

			/**
			 * Sets a value of this.state.
			 * @param key
			 * @param value
			 */
			updateState (key: string, value: any) : void;
		}
	}
}
