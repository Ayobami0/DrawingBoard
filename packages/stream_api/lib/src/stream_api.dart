/// Json data representation
typedef JSON = Map<String, dynamic>;

/// Interface for streaming functionalities.
abstract interface class StreamAPI {
  /// Send data to a stream.
  Future send({required String id, required String channel, required JSON? data});

  /// listen for update from the stream.
  Stream<JSON?> listen({required String id, required String channel});
}
