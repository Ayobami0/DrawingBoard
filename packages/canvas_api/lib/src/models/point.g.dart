// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointImpl _$$PointImplFromJson(Map<String, dynamic> json) => _$PointImpl(
      color: (json['color'] as num).toInt(),
      strokeWidth: (json['strokeWidth'] as num).toDouble(),
      dx: (json['dx'] as num).toDouble(),
      dy: (json['dy'] as num).toDouble(),
      isErazer: json['isErazer'] as bool,
    );

Map<String, dynamic> _$$PointImplToJson(_$PointImpl instance) =>
    <String, dynamic>{
      'color': instance.color,
      'strokeWidth': instance.strokeWidth,
      'dx': instance.dx,
      'dy': instance.dy,
      'isErazer': instance.isErazer,
    };
