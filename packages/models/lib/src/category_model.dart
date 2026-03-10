import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

/// Product category.
@Freezed(fromJson: true, toJson: true)
abstract class CategoryModel with _$CategoryModel {
  /// Creates a [CategoryModel] from JSON.
  const factory CategoryModel({
    required int id,
    required String name,
  }) = _CategoryModel;

  /// Parses [CategoryModel] from a JSON map.
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
