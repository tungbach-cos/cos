// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductRequestModel _$ProductRequestModelFromJson(Map<String, dynamic> json) =>
    _ProductRequestModel(
      id: ParsingHelper.nullableIntFromJson(json['id']),
      name: json['name'] as String?,
      categoryId: ParsingHelper.nullableIntFromJson(json['category_id']),
      unitId: ParsingHelper.nullableIntFromJson(json['unit_id']),
      sku: json['sku'] as String?,
      fullDescription: json['full_description'] as String?,
      features: ProductRequestModel._nullableStringListFromJson(
        json['features'],
      ),
      specifications: ProductRequestModel._nullableStringMapFromJson(
        json['specifications'],
      ),
      imageUrl: json['image_url'] as String?,
      price: ParsingHelper.nullableDoubleFromJson(json['price']),
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
