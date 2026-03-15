// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryRequestModel _$CategoryRequestModelFromJson(
  Map<String, dynamic> json,
) => _CategoryRequestModel(
  name: json['name'] as String?,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CategoryRequestModelToJson(
  _CategoryRequestModel instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};
