import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../../stream_api.dart';

class WebSocketAPI implements StreamAPI {
  const WebSocketAPI._(this._channel, this._stream);

  factory WebSocketAPI(String url) {
    final channel = WebSocketChannel.connect(Uri.parse(url));
    final stream = channel.stream.asBroadcastStream();
    return WebSocketAPI._(channel, stream);
  }

  final WebSocketChannel _channel;
  final Stream _stream;

  @override
  Stream<JSON?> listen({required String id, required String channel}) async* {
    await for (final jsonData in _stream) {
      final data = json.decode(jsonData);

      print(data);

      if (data['id'] == id && data['type'] == channel) {
        yield data;
      }
    }
  }

  @override
  Future send({required String id, required String channel, required JSON? data}) async {
    final jsonData = {'type': channel, 'data': data, 'id': id};

    _channel.sink.add(json.encode(jsonData));
  }
}
