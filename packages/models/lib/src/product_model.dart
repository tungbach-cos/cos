import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:models/src/category_model.dart';
import 'package:models/src/unit_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

/// Product entity with required category and unit.
@Freezed(fromJson: true, toJson: true)
abstract class ProductModel with _$ProductModel {
  /// Creates a [ProductModel] from JSON (e.g. API or database).
  const factory ProductModel({
    required int id,
    required String name,
    required CategoryModel category,
    required UnitModel unit,
    required String sku,
    String? fullDescription,
    List<String>? features,
    Map<String, dynamic>? specifications,
    String? imageUrl,
    double? price,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductModel;

  /// Parses [ProductModel] from a JSON map (e.g. from API or database).
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
