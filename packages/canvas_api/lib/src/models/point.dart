// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'point.freezed.dart';
part 'point.g.dart';

@freezed
/// Represents a drawing point.
///
/// A drawing is a list of points.
class Point with _$Point {
  const Point._();

  const factory Point({
    required int color,
    required double strokeWidth,
    required double dx,
    required double dy,
    required bool isErazer,
  }) = _Point;

  factory Point.fromJson(Map<String, Object?> json) => _$PointFromJson(json);

  Paint toPaint() {
    final p = Paint()
      ..color = Color(color)
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    if (isErazer) {
      p.blendMode = BlendMode.clear;
    }

    return p;
  }

  Offset position() => Offset(dx, dy);
}
