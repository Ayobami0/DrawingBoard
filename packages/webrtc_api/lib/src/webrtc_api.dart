import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:stream_api/stream_api.dart';

class WebRTCAPI {
  static const Map<String, dynamic> _config = {
    'iceServers': [
      {
        'urls': [
          'stun:stun1.l.google.com:19302',
          'stun:stun2.l.google.com:19302',
        ],
      },
    ],
  };

  static RTCPeerConnection? _peerConnection;
  static StreamAPI? _signaling;
  static MediaStream? localStream;
  static MediaStream? remoteStream;

  static _initialize(StreamAPI stream) async {
    _signaling = stream;

    _peerConnection = await createPeerConnection(_config);

    // Fixes an issue on the web. Credits to Comfortable_One8243 on reddit
    _peerConnection?.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeVideo,
        init: RTCRtpTransceiverInit(direction: TransceiverDirection.RecvOnly));
  }

  static createStreamSession(
      {required String id, required StreamAPI siginalingStream}) async {
    await _initialize(siginalingStream);

    // Push track from local stream to peer connection
    localStream?.getTracks().forEach((track) {
      _peerConnection?.addTrack(track, localStream!);
    });

    // Pull tracks from remote stream and add to video stream
    _peerConnection?.onTrack = (event) {
      event.streams[0].getTracks().forEach((track) {
        remoteStream?.addTrack(track);
      });
    };

    // Create an offer
    RTCSessionDescription offer = await _peerConnection!.createOffer();
    _peerConnection?.setLocalDescription(offer);

    // Listen for ICE candidates and send results to the database
    _peerConnection?.onIceCandidate = (event) {
      _signaling?.send(
        id: id,
        channel: 'candidate_offer',
        data: {
          'candidate': event.candidate,
          'sdpMid': event.sdpMid,
          'sdpMLineIndex': event.sdpMLineIndex
        },
      );
    };

    // Send session description object
    _signaling!.send(
      channel: 'offer',
      id: id,
      data: {'sdp': offer.sdp, 'type': offer.type},
    );

    // Listen for remote sdp (answers) from other clients
    _signaling
        ?.listen(channel: 'candidate_answer', id: id)
        .listen((candidate) async {
      final curRemoteAns = await _peerConnection?.getRemoteDescription();

      if (curRemoteAns == null && candidate?['sdp']) {
        final answerDescription =
            RTCSessionDescription(candidate?['sdp'], candidate?['type']);

        _peerConnection?.setRemoteDescription(answerDescription);
      }
    });

    // Listen for answers from a remote candidate
    _signaling
        ?.listen(channel: 'candidate_answer', id: id)
        .listen((event) async {
      final candidate = RTCIceCandidate(
          event?['candidate'], event?['sdpMid'], event?['sdpMLineIndex']);

      _peerConnection?.addCandidate(candidate);
    });
  }

  static joinStreamSession(
      {required String id, required StreamAPI stream}) async {
    await _initialize(stream);
  }
}
