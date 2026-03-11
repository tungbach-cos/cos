import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

/// Unit of measure or type for products.
@Freezed(fromJson: true, toJson: true)
abstract class UnitModel with _$UnitModel {
  /// Creates a [UnitModel] from JSON.
  const factory UnitModel({
    int? id,
    String? name,
  }) = _UnitModel;

  /// Parses [UnitModel] from a JSON map.
  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);
}
