// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryRequestModel _$CategoryRequestModelFromJson(
  Map<String, dynamic> json,
) => _CategoryRequestModel(
  id: ParsingHelper.nullableIntFromJson(json['id']),
  name: json['name'] as String?,
);

Map<String, dynamic> _$CategoryRequestModelToJson(
  _CategoryRequestModel instance,
) => <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};
