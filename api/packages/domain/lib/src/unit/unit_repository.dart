import 'package:domain/src/unit/exception/exception.dart';
import 'package:models/models.dart';

/// Repository interface for unit data operations in the API.
abstract interface class UnitRepository {
  /// Returns all units.
  Future<List<UnitModel>> getUnits();

  /// Returns a single unit by [id].
  /// Throws [UnitNotFoundException] if not found.
  Future<UnitModel> getUnit({required int id});

  /// Creates a new unit from [data].
  Future<UnitModel> createUnit({required UnitRequestModel data});

  /// Updates an existing unit with [id] using [data].
  Future<UnitModel> updateUnit({
    required int id,
    required UnitRequestModel data,
  });

  /// Deletes the unit with the given [id].
  Future<void> deleteUnit({required int id});
}
