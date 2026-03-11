import 'package:models/models.dart';

/// Data access contract for units of measure.
abstract interface class UnitDatasource {
  /// Returns all units from the backing store.
  Future<List<UnitModel>> getUnits();
}
