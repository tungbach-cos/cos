// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileRequestModel _$FileRequestModelFromJson(Map<String, dynamic> json) =>
    _FileRequestModel(
      bytes: (json['bytes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      contentType: json['content_type'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$FileRequestModelToJson(_FileRequestModel instance) =>
    <String, dynamic>{
      'bytes': instance.bytes,
      'content_type': instance.contentType,
      'name': instance.name,
    };
