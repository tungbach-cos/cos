// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileModel _$FileModelFromJson(Map<String, dynamic> json) => _FileModel(
  bytes: (json['bytes'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  contentType: json['content_type'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$FileModelToJson(_FileModel instance) =>
    <String, dynamic>{
      'bytes': instance.bytes,
      'content_type': instance.contentType,
      'name': instance.name,
    };
