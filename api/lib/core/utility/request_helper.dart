import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:models/models.dart';

/// Helpers for parsing request data (e.g. form data) into domain/models.
class RequestHelper {
  RequestHelper._();

  /// Parses the file under [key] from [formData] into [FileRequestModel].
  /// Returns null if no file is present. [fileName] is used for the name.
  static Future<FileRequestModel?> parseFileFromFormData(
    FormData formData, {
    String key = 'image',
    String fileName = '',
  }) async {
    final uploadedFile = formData.files[key];
    if (uploadedFile == null) return null;
    final bytes = await uploadedFile.readAsBytes();
    final ContentType(:mimeType) = uploadedFile.contentType;
    return FileRequestModel(
      bytes: bytes,
      contentType: mimeType,
      name: fileName,
    );
  }
}
