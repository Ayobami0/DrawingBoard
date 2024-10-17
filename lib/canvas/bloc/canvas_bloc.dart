import 'package:board_repository/board_repository.dart';
import 'package:canvas_repository/canvas_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'canvas_event.dart';
part 'canvas_state.dart';

class CanvasBloc extends Bloc<CanvasEvent, CanvasState> {
  CanvasBloc(BoardID id)
      : super(CanvasState(
            repository: CanvasRepository(
                id: id, streamAPI: WebSocketAPI('ws://localhost:8765')))) {
    on<CanvasToggleDrawTools>(_onToggleDrawTools);
    on<CanvasLoading>(_onLoading);
    on<CanvasZoomIn>(_onZoomIn);
    on<CanvasZoomOut>(_onZoomOut);
    on<CanvasDrawingToolSelected>(_onDrawingToolSelected);
    on<CanvasSelectPenColor>(_onPenColorSelected);
    on<CanvasPenSizeChanged>(_onPenSizeChange);
  }

  Future<void> _onLoading(
      CanvasLoading event, Emitter<CanvasState> emit) async {
    emit(state.copyWith(status: CanvasStatus.loading));

    await WebRTCAPI.createStreamSession(
        id: state.repository.id,
        siginalingStream: state.repository
            .streamAPI); // For testing, should be done upon creation or joining a board

    emit(state.copyWith(status: CanvasStatus.loaded));
  }

  Future<void> _onToggleDrawTools(
      CanvasToggleDrawTools event, Emitter<CanvasState> emit) async {
    emit(state.copyWith(showDrawTools: event.state));
  }

  Future<void> _onZoomIn(CanvasZoomIn event, Emitter<CanvasState> emit) async {
    emit(state.copyWith(zoom: state.zoom + 10));
  }

  Future<void> _onZoomOut(
      CanvasZoomOut event, Emitter<CanvasState> emit) async {
    emit(state.copyWith(zoom: state.zoom - 10));
  }

  Future<void> _onDrawingToolSelected(
      CanvasDrawingToolSelected event, Emitter<CanvasState> emit) async {
    emit(state.copyWith(tool: event.tool));
  }

  Future<void> _onPenColorSelected(
      CanvasSelectPenColor event, Emitter<CanvasState> emit) async {
    emit(state.copyWith(activePenColor: event.color));
  }

  Future<void> _onPenSizeChange(
      CanvasPenSizeChanged event, Emitter<CanvasState> emit) async {
    emit(state.copyWith(penSize: event.size));
  }
}
