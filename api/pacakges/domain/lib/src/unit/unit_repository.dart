import 'package:models/models.dart';

/// Repository interface for unit data operations in the API.
abstract interface class UnitRepository {
  /// Returns all units.
  Future<List<UnitModel>> getUnits();
}
