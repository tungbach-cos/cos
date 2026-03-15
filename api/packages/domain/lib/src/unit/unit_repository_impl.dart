import 'package:datasource/datasource.dart';
import 'package:domain/src/unit/exception/exception.dart';
import 'package:domain/src/unit/unit_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';

/// Default implementation of [UnitRepository] backed by [UnitDatasource].
@Injectable(as: UnitRepository)
final class UnitRepositoryImpl implements UnitRepository {
  /// Creates a [UnitRepositoryImpl].
  UnitRepositoryImpl({required UnitDatasource unitDatasource})
    : _unitDatasource = unitDatasource;

  final UnitDatasource _unitDatasource;

  @override
  Future<List<UnitModel>> getUnits() => _unitDatasource.getUnits();

  @override
  Future<UnitModel> getUnit({required int id}) async {
    final unit = await _unitDatasource.getUnit(id: id);
    if (unit == null) throw UnitNotFoundException(id: id);
    return unit;
  }

  @override
  Future<UnitModel> createUnit({required UnitRequestModel data}) =>
      _unitDatasource.createUnit(data: data.toJson());

  @override
  Future<UnitModel> updateUnit({
    required int id,
    required UnitRequestModel data,
  }) => _unitDatasource.updateUnit(id: id, data: data.toJson());

  @override
  Future<void> deleteUnit({required int id}) =>
      _unitDatasource.deleteUnit(id: id);
}
