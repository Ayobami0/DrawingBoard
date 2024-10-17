// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Point _$PointFromJson(Map<String, dynamic> json) {
  return _Point.fromJson(json);
}

/// @nodoc
mixin _$Point {
  int get color => throw _privateConstructorUsedError;
  double get strokeWidth => throw _privateConstructorUsedError;
  double get dx => throw _privateConstructorUsedError;
  double get dy => throw _privateConstructorUsedError;
  bool get isErazer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res, Point>;
  @useResult
  $Res call(
      {int color, double strokeWidth, double dx, double dy, bool isErazer});
}

/// @nodoc
class _$PointCopyWithImpl<$Res, $Val extends Point>
    implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? strokeWidth = null,
    Object? dx = null,
    Object? dy = null,
    Object? isErazer = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      dx: null == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double,
      dy: null == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double,
      isErazer: null == isErazer
          ? _value.isErazer
          : isErazer // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointImplCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$$PointImplCopyWith(
          _$PointImpl value, $Res Function(_$PointImpl) then) =
      __$$PointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int color, double strokeWidth, double dx, double dy, bool isErazer});
}

/// @nodoc
class __$$PointImplCopyWithImpl<$Res>
    extends _$PointCopyWithImpl<$Res, _$PointImpl>
    implements _$$PointImplCopyWith<$Res> {
  __$$PointImplCopyWithImpl(
      _$PointImpl _value, $Res Function(_$PointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? strokeWidth = null,
    Object? dx = null,
    Object? dy = null,
    Object? isErazer = null,
  }) {
    return _then(_$PointImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      dx: null == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double,
      dy: null == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double,
      isErazer: null == isErazer
          ? _value.isErazer
          : isErazer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointImpl extends _Point with DiagnosticableTreeMixin {
  const _$PointImpl(
      {required this.color,
      required this.strokeWidth,
      required this.dx,
      required this.dy,
      required this.isErazer})
      : super._();

  factory _$PointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointImplFromJson(json);

  @override
  final int color;
  @override
  final double strokeWidth;
  @override
  final double dx;
  @override
  final double dy;
  @override
  final bool isErazer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Point(color: $color, strokeWidth: $strokeWidth, dx: $dx, dy: $dy, isErazer: $isErazer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Point'))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('strokeWidth', strokeWidth))
      ..add(DiagnosticsProperty('dx', dx))
      ..add(DiagnosticsProperty('dy', dy))
      ..add(DiagnosticsProperty('isErazer', isErazer));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth) &&
            (identical(other.dx, dx) || other.dx == dx) &&
            (identical(other.dy, dy) || other.dy == dy) &&
            (identical(other.isErazer, isErazer) ||
                other.isErazer == isErazer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, color, strokeWidth, dx, dy, isErazer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      __$$PointImplCopyWithImpl<_$PointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointImplToJson(
      this,
    );
  }
}

abstract class _Point extends Point {
  const factory _Point(
      {required final int color,
      required final double strokeWidth,
      required final double dx,
      required final double dy,
      required final bool isErazer}) = _$PointImpl;
  const _Point._() : super._();

  factory _Point.fromJson(Map<String, dynamic> json) = _$PointImpl.fromJson;

  @override
  int get color;
  @override
  double get strokeWidth;
  @override
  double get dx;
  @override
  double get dy;
  @override
  bool get isErazer;
  @override
  @JsonKey(ignore: true)
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
