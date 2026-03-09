import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

/// Represents a product with all its details.
///
/// This model is used throughout the app to display product information
/// in lists, cards, and detail pages.
@JsonSerializable()
final class ProductModel {
  /// Creates a product model.
  const ProductModel({
    this.id,
    this.name,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  /// Unique identifier for the product.
  final int? id;

  /// Product name in Vietnamese.
  final String? name;
}
