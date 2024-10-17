import 'package:board_api/board_api.dart';
import 'package:canvas_api/canvas_api.dart';
import 'package:stream_api/stream_api.dart';

/// Repository for handling canvas related requests.
class CanvasRepository implements CanvasAPI {
  final StreamAPI streamAPI;
  final BoardID id;

  CanvasRepository({required this.streamAPI, required this.id});

  @override
  Future clearCanvas() {
    // TODO: implement clearCanvas
    throw UnimplementedError();
  }

  @override
  Future drawPoint(Point? point) async {
    await streamAPI.send(id: id, channel: 'drawing', data: point?.toJson());
  }

  @override
  Future getDrawing() {
    // TODO: implement getDrawing
    throw UnimplementedError();
  }

  @override
  Stream<List<Point?>> get points async* {
    await for (final d in streamAPI.listen(id: id, channel: 'drawing')) {
      final drawing = d!['data'] as List;
      final points =
          drawing.map((p) => p == null ? null : Point.fromJson(p)).toList();

      yield points;
    }
  }

  @override
  Future redo() {
    // TODO: implement redo
    throw UnimplementedError();
  }

  @override
  Future undo() {
    // TODO: implement undo
    throw UnimplementedError();
  }
}
