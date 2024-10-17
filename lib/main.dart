import 'package:board/canvas/bloc/canvas_bloc.dart';
import 'package:board/canvas/view/canvas_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CanvasBloc('somerandomblocid')..add(CanvasLoading())) //TODO: Replace with real board id
        ],
        child: const BoardCanvasView(),
      ),
    );
  }
}
