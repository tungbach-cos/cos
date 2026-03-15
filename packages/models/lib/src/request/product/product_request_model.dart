import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:models/src/utility/utility.dart';

part 'product_request_model.freezed.dart';
part 'product_request_model.g.dart';

/// Product request payload (create/update) without category or unit nesting.
@Freezed(fromJson: true, toJson: true)
abstract class ProductRequestModel with _$ProductRequestModel {
  /// Creates a [ProductRequestModel] from JSON.
  const factory ProductRequestModel({
    String? name,
    @JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? categoryId,
    @JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? unitId,
    String? sku,
    String? fullDescription,
    @JsonKey(fromJson: ProductRequestModel._nullableStringListFromJson)
    List<String>? features,
    @JsonKey(fromJson: ProductRequestModel._nullableStringMapFromJson)
    Map<String, dynamic>? specifications,
    String? imageUrl,
    @JsonKey(fromJson: ParsingHelper.nullableDoubleFromJson) double? price,
    DateTime? updatedAt,
  }) = _ProductRequestModel;

  /// Parses [ProductRequestModel] from a JSON map.
  factory ProductRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestModelFromJson(json);

  static List<String>? _nullableStringListFromJson(dynamic value) {
    if (value == null) return null;
    if (value is List<dynamic>) {
      return value.map((e) => e.toString()).toList();
    }
    if (value is String) {
      final s = value.trim();
      if (s.isEmpty) return null;
      try {
        final decoded = jsonDecode(s) as List<dynamic>?;
        return decoded?.map((e) => e.toString()).toList();
      } on Object catch (_) {
        throw FormatException(
          'Field "features" must be a JSON array of strings',
          value,
        );
      }
    }
    return null;
  }

  static Map<String, dynamic>? _nullableStringMapFromJson(dynamic value) {
    if (value == null) return null;
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return Map<String, dynamic>.from(value);
    if (value is String) {
      final s = value.trim();
      if (s.isEmpty) return null;
      try {
        return jsonDecode(s) as Map<String, dynamic>?;
      } on Object catch (_) {
        throw FormatException(
          'Field "specifications" must be a JSON object',
          value,
        );
      }
    }
    return null;
  }
}
