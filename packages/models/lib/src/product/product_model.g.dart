// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      unit: json['unit'] == null
          ? null
          : UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
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

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'category': ?instance.category?.toJson(),
      'unit': ?instance.unit?.toJson(),
      'sku': ?instance.sku,
      'full_description': ?instance.fullDescription,
      'features': ?instance.features,
      'specifications': ?instance.specifications,
      'image_url': ?instance.imageUrl,
      'price': ?instance.price,
      'created_at': ?instance.createdAt?.toIso8601String(),
      'updated_at': ?instance.updatedAt?.toIso8601String(),
    };
