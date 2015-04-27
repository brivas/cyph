module Cyph {
	export class WebRTC {
		public static IceCandidate: any			= Util.getValue(self, [
			'RTCIceCandidate',
			'mozRTCIceCandidate'
		]);

		public static MediaStream: any			= Util.getValue(self, [
			'MediaStream',
			'webkitMediaStream'
		]);

		public static PeerConnection: any		= Util.getValue(self, [
			'RTCPeerConnection',
			'mozRTCPeerConnection',
			'webkitRTCPeerConnection'
		]);

		public static SessionDescription: any	= Util.getValue(self, [
			'RTCSessionDescription',
			'mozRTCSessionDescription'
		]);

		public static isSupported: boolean		= !!WebRTC.PeerConnection;

		public static getUserMedia (...args: any[]) : void {
			Util.getValue(
				navigator,
				[
					'getUserMedia',
					'mozGetUserMedia',
					'webkitGetUserMedia'
				],
				() => {}
			).apply(navigator, args);
		}
	}
}