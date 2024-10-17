part of 'canvas_bloc.dart';

enum CanvasStatus { initial, loading, loaded, error }

final class CanvasState extends Equatable {

  const CanvasState({
    required this.repository,
    this.status = CanvasStatus.initial,
    this.mic = false,
    this.cam = false,
    this.tool = DrawingTool.pen,
    this.zoom = 100,
    this.showDrawTools = true,
    this.activePenColor = Colors.black,
    this.penSize = 1,
  });

  final CanvasRepository repository;
  final CanvasStatus status;
  final bool mic, cam, showDrawTools;
  final int zoom;
  final double penSize;
  final DrawingTool tool;
  final Color activePenColor;

  CanvasState copyWith({
    CanvasStatus? status,
    bool? mic,
    bool? cam,
    DrawingTool? tool,
    int? zoom,
    bool? showDrawTools,
    Color? activePenColor,
    double? penSize,
  }) =>
      CanvasState(
      repository: repository,
      status: status ?? this.status,
      mic: mic ?? this.mic,
      cam: cam ?? this.cam,
      tool: tool ?? this.tool,
      zoom: zoom ?? this.zoom,
      penSize: penSize ?? this.penSize,
      showDrawTools: showDrawTools ?? this.showDrawTools,
      activePenColor: activePenColor ?? this.activePenColor,
    );

  @override
  List<Object?> get props => [status, cam, mic, zoom, tool, showDrawTools, activePenColor, penSize, repository];
}
