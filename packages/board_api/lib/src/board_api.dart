import 'package:board_api/src/models/board.dart';

/// {@template board_api}
/// The interface for interacting with the board backend.
/// {@endtemplate}
abstract interface class BoardAPI {
  /// {@macro board_api}
  const BoardAPI();

  /// Gets a stream of all [Board] avaliable to a user id.
  Stream<List<Board>> getBoards();

  /// Creates a new [Board] and returns the created [Board] id.
  Future<BoardID> createBoard();

  /// Delete an already existing [Board].
  Future<void> deleteBoard(BoardID id);

  /// Update a [Board].
  Future<Board> updateBoard(BoardID id);

  /// Join a [Board].
  Future<Board> joinBoard(BoardID id);

  /// Get users connected to a [Board] session.
  Stream<int> getActiveBoardParticipant(BoardID id);
}
