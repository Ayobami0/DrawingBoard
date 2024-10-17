import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:canvas_repository/canvas_repository.dart';

part 'drawing_state.dart';

class DrawingCubit extends Cubit<DrawingState> {
  DrawingCubit(CanvasRepository repository)
      : super(DrawingState(drawing: const [], repository: repository)) {
    repository.points.listen((event) {
      emit(state.copyWith(event));
    });
  }

  void draw(Point? point) {
    if (state.drawing.isNotEmpty &&
        state.drawing.last == null &&
        point == null) {
      // Don't emit new state if both the last item and new are null
      return;
    }

    state.repository.drawPoint(point);
  }
}
