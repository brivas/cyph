/// <reference path="../typings/iwebsign.d.ts" />
/// <reference path="../typings/storage.d.ts" />
/// <reference path="../../lib/typings/tsd.d.ts" />

/// <reference path="../cyph/p2p/enums.ts" />
/// <reference path="../cyph/session/enums.ts" />
/// <reference path="../cyph/ui/chat/enums.ts" />

/// <reference path="../cyph/icontroller.ts" />
/// <reference path="../cyph/channel/ichannel.ts" />
/// <reference path="../cyph/p2p/ifiletransfer.ts" />
/// <reference path="../cyph/p2p/ip2p.ts" />
/// <reference path="../cyph/session/imessage.ts" />
/// <reference path="../cyph/session/imutex.ts" />
/// <reference path="../cyph/session/iotr.ts" />
/// <reference path="../cyph/session/isession.ts" />
/// <reference path="../cyph/ui/idialogmanager.ts" />
/// <reference path="../cyph/ui/inotifier.ts" />
/// <reference path="../cyph/ui/isidebar.ts" />
/// <reference path="../cyph/ui/isignupform.ts" />
/// <reference path="../cyph/ui/chat/ichat.ts" />
/// <reference path="../cyph/ui/chat/icyphertext.ts" />
/// <reference path="../cyph/ui/chat/ip2pmanager.ts" />
/// <reference path="../cyph/ui/chat/iphotomanager.ts" />
/// <reference path="../cyph/ui/chat/iscrollmanager.ts" />


let IS_WEB: boolean	= 'IS_WEB' in self ?
	self['IS_WEB'] :
	typeof window === 'object'
;

for (let k of ['window', 'document']) {
	if (!(k in self)) {
		self[k]	= self;
	}
}

for (let k of [
	'history',
	'location',
	'localStorage',
	'navigator'
]) {
	if (!(k in self)) {
		self[k]	= null;
	}
}

let crypto: Crypto;
let WebSign: IWebSign;

let onthreadmessage: (e: MessageEvent) => any;
let Translations: {[language: string] : {[text: string] : string}};