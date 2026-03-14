import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_request_model.freezed.dart';
part 'product_request_model.g.dart';

/// Product request payload (create/update) without category or unit nesting.
@Freezed(fromJson: true, toJson: true)
abstract class ProductRequestModel with _$ProductRequestModel {
  /// Creates a [ProductRequestModel] from JSON.
  const factory ProductRequestModel({
    int? id,
    String? name,
    int? categoryId,
    int? unitId,
    String? sku,
    String? fullDescription,
    List<String>? features,
    Map<String, dynamic>? specifications,
    String? imageUrl,
    double? price,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductRequestModel;

  /// Parses [ProductRequestModel] from a JSON map.
  factory ProductRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestModelFromJson(json);
}
