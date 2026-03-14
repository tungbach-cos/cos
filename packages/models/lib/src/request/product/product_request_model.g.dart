// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductRequestModel _$ProductRequestModelFromJson(Map<String, dynamic> json) =>
    _ProductRequestModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      unitId: (json['unit_id'] as num?)?.toInt(),
      sku: json['sku'] as String?,
      fullDescription: json['full_description'] as String?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      specifications: json['specifications'] as Map<String, dynamic>?,
      imageUrl: json['image_url'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ProductRequestModelToJson(
  _ProductRequestModel instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'category_id': ?instance.categoryId,
  'unit_id': ?instance.unitId,
  'sku': ?instance.sku,
  'full_description': ?instance.fullDescription,
  'features': ?instance.features,
  'specifications': ?instance.specifications,
  'image_url': ?instance.imageUrl,
  'price': ?instance.price,
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};
