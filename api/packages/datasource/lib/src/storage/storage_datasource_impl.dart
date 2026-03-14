import 'dart:typed_data';

import 'package:datasource/src/storage/model/storage_bucket.dart';
import 'package:datasource/src/storage/storage_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase/supabase.dart';

/// Supabase-backed implementation of [StorageDatasource].
@Injectable(as: StorageDatasource)
final class StorageDatasourceImpl implements StorageDatasource {
  /// Creates a [StorageDatasourceImpl] with the given [supabase] client.
  StorageDatasourceImpl({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  final SupabaseClient _supabase;

  @override
  Future<String> uploadFile({
    required StorageBucket bucket,
    required String path,
    required List<int> bytes,
    String? contentType,
  }) async {
    final bucketName = bucket.name;
    await _ensureBucketExists(bucketName: bucketName);

    final storage = _supabase.storage.from(bucketName);
    final exists = await storage.exists(path);
    if (exists) {
      return storage.getPublicUrl(path);
    }

    final fileOptions = FileOptions(
      contentType: contentType,
      upsert: true,
    );
    await storage.uploadBinary(
      path,
      Uint8List.fromList(bytes),
      fileOptions: fileOptions,
    );
    return storage.getPublicUrl(path);
  }

  @override
  Future<void> deleteFile({
    required StorageBucket bucket,
    required String path,
  }) async {
    await _supabase.storage.from(bucket.name).remove([path]);
  }

  Future<void> _ensureBucketExists({required String bucketName}) async {
    try {
      await _supabase.storage.getBucket(bucketName);
    } on Object catch (_) {
      await _supabase.storage.createBucket(
        bucketName,
        const BucketOptions(public: true),
      );
    }
  }
}
