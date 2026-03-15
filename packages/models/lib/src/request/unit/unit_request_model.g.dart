// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnitRequestModel _$UnitRequestModelFromJson(Map<String, dynamic> json) =>
    _UnitRequestModel(
      id: ParsingHelper.nullableIntFromJson(json['id']),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UnitRequestModelToJson(_UnitRequestModel instance) =>
    <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};
