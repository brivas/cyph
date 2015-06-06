module Cyph {
	export module Crypto {
		/**
		 * Message body to be encrypted within Castle cyphertext.
		 * Contains metadata to ensure that large messages split across
		 * multiple cyphertext blocks are correctly pieced together.
		 *
		 * Also transparently adds padding to ensure that the same message
		 * sent between key ratchets won't yield the same cyphertext.
		 */
		export class CastleMessageInner {
			private static paddingDelimiter: string	= '☁☁☁ PRAISE BE TO CYPH ☀☀☀';

			private static getPadding () : string {
				return Array.prototype.slice.call(
					crypto.getRandomValues(
						new Uint8Array(
							crypto.getRandomValues(new Uint8Array(1))[0] +
							100
						)
					)
				).join('');
			}

			private static pad (s: string) : string {
				return (
					CastleMessageInner.getPadding() +
					CastleMessageInner.paddingDelimiter +
					s +
					CastleMessageInner.paddingDelimiter +
					CastleMessageInner.getPadding()
				);
			}

			private static unpad (s: string) : string {
				return s.split(CastleMessageInner.paddingDelimiter)[1];
			}


			private messageChunk: string;

			/**
			 * Retuns the original message / message chunk.
			 */
			public toString () : string {
				return CastleMessageInner.unpad(this.messageChunk);
			}

			/**
			 * @param id Random unique ID.
			 * @param index Number designating the contained message chunk's position
			 * within the sequence of chunks associated with this message.
			 * @param total Total number of chunks associated with this message.
			 * @param messageChunk Block of plaintext data.
			 */
			public constructor (
				public id: string,
				public index: number,
				public total: number,
				messageChunk: string
			) {
				this.messageChunk	= CastleMessageInner.pad(messageChunk);
			}
		}
	}
}