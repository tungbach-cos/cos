import 'package:models/models.dart';

/// Data access contract for units of measure.
abstract interface class UnitDatasource {
  /// Returns all units from the backing store.
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
