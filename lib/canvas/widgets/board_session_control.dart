import 'package:board/canvas/bloc/canvas_bloc.dart';
import 'package:board/canvas/widgets/icons_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoardSessionControl extends StatelessWidget {
  const BoardSessionControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isCamOn = context.watch<CanvasBloc>().state.cam;
    final isMicOn = context.watch<CanvasBloc>().state.mic;
    return Align(
      alignment: Alignment.bottomCenter,
      child: IconsContainer(
        children: [
          IconButton(
              onPressed: () {},
              icon: FaIcon(
                isCamOn ? Icons.videocam_outlined : Icons.videocam_off_outlined,
                color: isCamOn ? null : Colors.red,
              )),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              isMicOn ? Icons.mic_outlined : Icons.mic_off_outlined,
              color: isMicOn ? null : Colors.red,
            ),
          ),
          IconButton(onPressed: () {}, icon: const FaIcon(Icons.chat_outlined)),
          IconButton(
              onPressed: () {},
              icon: const FaIcon(Icons.keyboard_arrow_right_outlined)),
        ],
      ),
    );
  }
}

