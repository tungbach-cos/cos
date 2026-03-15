import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:models/src/utility/utility.dart';

part 'category_request_model.freezed.dart';
part 'category_request_model.g.dart';

/// Category request payload (create/update).
@Freezed(fromJson: true, toJson: true)
abstract class CategoryRequestModel with _$CategoryRequestModel {
  /// Creates a [CategoryRequestModel].
  const factory CategoryRequestModel({
    @JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? id,
    String? name,
  }) = _CategoryRequestModel;

  /// Parses [CategoryRequestModel] from a JSON map.
  factory CategoryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryRequestModelFromJson(json);
}
