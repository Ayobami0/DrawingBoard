import 'package:board_api/board_api.dart';

class BoardRepository {
  const BoardRepository({
    required BoardAPI boardApi
  }): _boardAPI = boardApi;

  final BoardAPI _boardAPI;

  Stream<List<Board>> getBoards() => _boardAPI.getBoards();
}
