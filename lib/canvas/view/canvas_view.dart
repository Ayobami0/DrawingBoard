import 'package:board/canvas/bloc/canvas_bloc.dart';
import 'package:board/canvas/cubit/drawing_cubit.dart';
import 'package:board/canvas/widgets/board_canvas.dart';
import 'package:board/canvas/widgets/board_session_control.dart';
import 'package:board/canvas/widgets/canvas_writing_control.dart';
import 'package:board/canvas/widgets/canvas_zoom_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardCanvasView extends StatelessWidget {
  const BoardCanvasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CanvasBloc, CanvasState>(builder: (context, state) {
          if (state.status == CanvasStatus.loaded) {
            return LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  BlocProvider<DrawingCubit>(
                    create: (context) => DrawingCubit(context.read<CanvasBloc>().state.repository),
                    child: const BoardCanvas(),
                  ),
                  const CanvasZoomControl(),
                  const BoardSessionControl(),
                  const CanvasWritingControl(),
                ],
              );
            });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
