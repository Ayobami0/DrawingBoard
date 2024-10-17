import 'package:board/canvas/bloc/canvas_bloc.dart';
import 'package:board/canvas/cubit/drawing_cubit.dart';
import 'package:canvas_repository/canvas_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardCanvas extends StatelessWidget {
  const BoardCanvas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tool = context.watch<CanvasBloc>().state.tool;
    final color = context.watch<CanvasBloc>().state.activePenColor;
    final penSize = context.watch<CanvasBloc>().state.penSize;
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onPanUpdate: (details) {
        switch (tool) {
          case DrawingTool.pen:
            context.read<DrawingCubit>().draw(
                  Point(
                    color: color.value,
                    strokeWidth: penSize,
                    isErazer: false,
                    dx: details.localPosition.dx,
                    dy: details.localPosition.dy,
                  ),
                );
            break;
          case DrawingTool.pan:
            return;
          case DrawingTool.eraser:
            context.read<DrawingCubit>().draw(
                  Point(
                    color: Colors.transparent.value,
                    isErazer: true,
                    strokeWidth: penSize,
                    dx: details.localPosition.dx,
                    dy: details.localPosition.dy,
                  ),
                );
            break;
        }
      },
      onPanEnd: (_) {
        switch (tool) {
          case DrawingTool.eraser:
          case DrawingTool.pen:
            context.read<DrawingCubit>().draw(null);
            break;
          default:
            return;
        }
      },
      child: BlocBuilder<DrawingCubit, DrawingState>(builder: (context, state) {
        return SizedBox(
          width: size.width,
          height: size.height,
          child: CustomPaint(
            painter: _CanvasPainter(state.drawing),
          ),
        );
      }),
    );
  }
}

class _CanvasPainter extends CustomPainter {
  final List<Point?> drawing;

  const _CanvasPainter(this.drawing);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());
    for (int i = 0; i < drawing.length - 1; i++) {
      if (drawing[i] != null && drawing[i + 1] != null) {
        canvas.drawLine(drawing[i]!.position(), drawing[i + 1]!.position(),
            drawing[i]!.toPaint());
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
