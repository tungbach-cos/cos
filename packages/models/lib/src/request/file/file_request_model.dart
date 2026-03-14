import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_request_model.freezed.dart';
part 'file_request_model.g.dart';

/// Request payload for a file (bytes, content type, and name).
@Freezed(fromJson: true, toJson: true)
abstract class FileRequestModel with _$FileRequestModel {
  /// Creates a [FileRequestModel] with [bytes], [contentType], and [name].
  const factory FileRequestModel({
    required List<int> bytes,
    required String contentType,
    required String name,
  }) = _FileRequestModel;

  /// Parses [FileRequestModel] from a JSON map.
  factory FileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FileRequestModelFromJson(json);
}
