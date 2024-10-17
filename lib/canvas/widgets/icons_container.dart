import 'package:flutter/material.dart';

class IconsContainer extends StatelessWidget {
  const IconsContainer(
      {super.key, required this.children, this.direction = Axis.horizontal});

  final List<Widget> children;
  final Axis direction;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 2,
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(0.2))
          ]),
      child: direction == Axis.horizontal
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: children,
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
    );
  }
}
