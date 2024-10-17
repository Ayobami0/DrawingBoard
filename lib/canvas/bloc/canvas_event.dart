part of 'canvas_bloc.dart';

enum DrawingTool { pen, eraser, pan }

sealed class CanvasEvent extends Equatable {
  const CanvasEvent();

  @override
  List<Object?> get props => [];
}

final class CanvasLoading extends CanvasEvent {}

final class CanvasZoomIn extends CanvasEvent {}

final class CanvasZoomOut extends CanvasEvent {}

final class CanvasDrawingToolSelected extends CanvasEvent {
  const CanvasDrawingToolSelected(this.tool);

  final DrawingTool tool;

  @override
  List<Object?> get props => [tool];
}

final class CanvasToggleMic extends CanvasEvent {
  const CanvasToggleMic(this.state);

  final bool state;
  @override
  List<Object?> get props => [state];
}

final class CanvasToggleCam extends CanvasEvent {
  const CanvasToggleCam(this.state);

  final bool state;
  @override
  List<Object?> get props => [state];
}

final class CanvasToggleDrawTools extends CanvasEvent {
  const CanvasToggleDrawTools(this.state);

  final bool state;
  @override
  List<Object?> get props => [state];
}

final class CanvasSelectPenColor extends CanvasEvent {
  const CanvasSelectPenColor(this.color);

  final Color color;

  @override
    List<Object?> get props => [color];
}

final class CanvasPenSizeChanged extends CanvasEvent {
  const CanvasPenSizeChanged(this.size);

  final double size;

  @override
    List<Object?> get props => [size];
}
