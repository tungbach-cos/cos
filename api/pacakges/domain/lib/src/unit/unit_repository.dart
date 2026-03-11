import 'package:models/models.dart';

/// Repository interface for unit data operations in the API.
abstract interface class UnitRepository {
  /// Returns all units.
  Future<List<UnitModel>> getUnits();

  /// Returns a single unit by [id] or `null` if it does not exist.
  Future<UnitModel?> getUnit({required int id});

  /// Creates a new unit with the given [data].
  Future<UnitModel> createUnit({required Map<String, dynamic> data});

  /// Updates an existing unit identified by [id] using [data].
  Future<UnitModel> updateUnit({
    required int id,
    required Map<String, dynamic> data,
  });

  /// Deletes the unit with the given [id].
  Future<void> deleteUnit({required int id});
}
