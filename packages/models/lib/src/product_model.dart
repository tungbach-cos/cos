// Freezed factory params use @JsonKey; analyzer does not recognize that.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

/// Product entity with optional category and unit references.
@Freezed(fromJson: true, toJson: true)
class ProductModel with _$ProductModel {
  /// Creates a [ProductModel] from JSON (e.g. API or database).
  const factory ProductModel({
    required int id,
    required String name,
    required int unitId,
    required String sku,
    @JsonKey(name: 'full_description') String? fullDescription,
    List<String>? features,
    Map<String, dynamic>? specifications,
    @JsonKey(name: 'image_url') String? imageUrl,
    double? price,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'category_id') int? categoryId,
  }) = _ProductModel;

  /// Parses [ProductModel] from a JSON map (e.g. from API or database).
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
