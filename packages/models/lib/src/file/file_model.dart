import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';

/// Represents a file with raw bytes, content type, and optional name.
@Freezed(fromJson: true, toJson: true)
abstract class FileModel with _$FileModel {
  /// Creates a [FileModel] with [bytes], [contentType], and optional [name].
  const factory FileModel({
    required List<int> bytes,
    required String contentType,
    required String name,
  }) = _FileModel;

  /// Parses [FileModel] from a JSON map.
  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}
