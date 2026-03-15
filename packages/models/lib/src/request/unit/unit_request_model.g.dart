// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnitRequestModel _$UnitRequestModelFromJson(Map<String, dynamic> json) =>
    _UnitRequestModel(
      name: json['name'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UnitRequestModelToJson(_UnitRequestModel instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'updated_at': ?instance.updatedAt?.toIso8601String(),
    };
