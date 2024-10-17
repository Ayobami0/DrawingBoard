import 'package:board/canvas/bloc/canvas_bloc.dart';
import 'package:board/canvas/widgets/icons_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CanvasZoomControl extends StatelessWidget {
  const CanvasZoomControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final zoomLevel = context.watch<CanvasBloc>().state.zoom;
    return Align(
        alignment: Alignment.topRight,
        child: IconsContainer(children: [
          IconButton(
              onPressed: () => context.read<CanvasBloc>().add(CanvasZoomOut()),
              icon: const FaIcon(
                Icons.zoom_out_outlined,
              )),
          Text(
            "${zoomLevel.toString()}%",
          ),
          IconButton(
              onPressed: () => context.read<CanvasBloc>().add(CanvasZoomIn()),
              icon: const FaIcon(
                Icons.zoom_in_outlined,
              )),
        ]));
  }
}

