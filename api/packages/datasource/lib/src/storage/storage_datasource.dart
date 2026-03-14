import 'package:datasource/src/storage/model/storage_bucket.dart';

/// Data access contract for Supabase storage (file uploads).
abstract interface class StorageDatasource {
  /// Uploads [bytes] to the given [path] in [bucket].
  /// Creates [bucket] if it does not exist. Returns the public URL of the file.
  Future<String> uploadFile({
    required StorageBucket bucket,
    required String path,
    required List<int> bytes,
    String? contentType,
  });

  /// Deletes the file at [path] in [bucket].
  Future<void> deleteFile({
    required StorageBucket bucket,
    required String path,
  });
}
