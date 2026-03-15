import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:models/src/utility/utility.dart';

part 'unit_request_model.freezed.dart';
part 'unit_request_model.g.dart';

/// Unit request payload (create/update).
@Freezed(fromJson: true, toJson: true)
abstract class UnitRequestModel with _$UnitRequestModel {
  /// Creates a [UnitRequestModel].
  const factory UnitRequestModel({
    @JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? id,
    String? name,
  }) = _UnitRequestModel;

  /// Parses [UnitRequestModel] from a JSON map.
  factory UnitRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UnitRequestModelFromJson(json);
}
