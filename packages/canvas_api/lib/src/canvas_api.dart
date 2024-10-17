import 'package:canvas_api/src/models/point.dart';

/// Interface for canvas functionalities.
abstract interface class CanvasAPI {

  /// Gets the drawing for a particular Board/Canvas.
  ///
  /// This returns a list of drawing. If you want a stream,
  /// use [points] instead.
  Future getDrawing();

  /// Clear the current canvas, removing all points
  Future clearCanvas();

  /// Draw [Point](s) on the canvas.
  ///
  /// Erasing is the same as drawing, just with the [BlendMode.color] set to
  /// the canvas color.
  Future drawPoint(Point? point);

  /// Stream out incoming drawing data.
  Stream<List<Point?>> get points;

  /// Undo an update from the drawing stream.
  Future undo();

  /// Redo an update on the drawing stream.
  Future redo();
}
