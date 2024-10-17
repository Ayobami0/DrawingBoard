import 'package:board/canvas/bloc/canvas_bloc.dart';
import 'package:board/canvas/widgets/canvas_pen_options.dart';
import 'package:board/canvas/widgets/icons_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CanvasWritingControl extends StatefulWidget {
  const CanvasWritingControl({
    super.key,
  });

  @override
  State<CanvasWritingControl> createState() => _CanvasWritingControlState();
}

class _CanvasWritingControlState extends State<CanvasWritingControl> {
  bool _showOpt = false;

  @override
  Widget build(BuildContext context) {
    final tool = context.watch<CanvasBloc>().state.tool;
    final showTools = context.watch<CanvasBloc>().state.showDrawTools;
    return Align(
      alignment: Alignment.centerLeft,
      child: showTools
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconsContainer(
                  direction: Axis.vertical,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.read<CanvasBloc>().add(
                                const CanvasDrawingToolSelected(
                                    DrawingTool.pan),
                              );
                          setState(() {
                            _showOpt = false;
                          });
                        },
                        color: tool == DrawingTool.pan ? Colors.blue : null,
                        icon: const FaIcon(Icons.pan_tool_outlined)),
                    IconButton(
                      onPressed: () {
                        context.read<CanvasBloc>().add(
                              const CanvasDrawingToolSelected(DrawingTool.pen),
                            );
                        setState(() {
                          _showOpt = !_showOpt;
                        });
                      },
                      icon: const FaIcon(Icons.edit_outlined),
                      color: tool == DrawingTool.pen ? Colors.blue : null,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CanvasBloc>().add(
                            const CanvasDrawingToolSelected(DrawingTool.eraser),
                          );
                        setState(() {
                          _showOpt = !_showOpt;
                        });
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.eraser,
                        size: 20,
                      ),
                      color: tool == DrawingTool.eraser ? Colors.blue : null,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(Icons.image_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(Icons.description_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          Icons.undo_outlined,
                          size: 20,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          Icons.redo_outlined,
                          size: 20,
                        )),
                    IconButton(
                        onPressed: () => context
                            .read<CanvasBloc>()
                            .add(const CanvasToggleDrawTools(false)),
                        icon: const FaIcon(Icons.keyboard_arrow_left_outlined)),
                  ],
                ),
                if (_showOpt) const CanvasPenOptions()
              ],
            )
          : IconButton(
              onPressed: () => context
                  .read<CanvasBloc>()
                  .add(const CanvasToggleDrawTools(true)),
              icon: const FaIcon(Icons.keyboard_arrow_right_outlined),
            ),
    );
  }
}
