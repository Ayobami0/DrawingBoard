part of 'drawing_cubit.dart';

final class DrawingState extends Equatable {
  const DrawingState({required this.repository, required this.drawing});

  final CanvasRepository repository;
  final List<Point?> drawing;

  DrawingState copyWith(List<Point?>? drawing) =>
      DrawingState(repository: repository, drawing: drawing ?? this.drawing);

  @override
  List<Object?> get props => [drawing, repository];
}
