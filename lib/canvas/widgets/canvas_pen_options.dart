import 'package:board/canvas/bloc/canvas_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CanvasPenOptions extends StatelessWidget {
  const CanvasPenOptions({
    super.key,
  });

  final List<Color> colors = const [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    final penSize = context.watch<CanvasBloc>().state.penSize;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 2,
            offset: const Offset(0, 0),
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slider(
            value: penSize,
            min: 1,
            max: 50,
            onChanged: (v) {
              context.read<CanvasBloc>().add(CanvasPenSizeChanged(v));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...colors.map(
                (c) => GestureDetector(
                  onTap: () =>
                      context.read<CanvasBloc>().add(CanvasSelectPenColor(c)),
                  child: BlocBuilder<CanvasBloc, CanvasState>(
                      builder: (context, state) {
                    return AnimatedContainer(
                      decoration: BoxDecoration(
                          color: c,
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(100)),
                      duration: const Duration(milliseconds: 150),
                      width: c == state.activePenColor ? 25 : 20,
                      height: c == state.activePenColor ? 25 : 20,
                      child: c == state.activePenColor
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 16,
                            )
                          : null,
                    );
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

