import 'package:datasource/src/unit/unit_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:supabase/supabase.dart';

/// Supabase-backed implementation of [UnitDatasource].
@Injectable(as: UnitDatasource)
final class UnitDatasourceImpl implements UnitDatasource {
  /// Creates a [UnitDatasourceImpl] with the given [supabase] client.
  UnitDatasourceImpl({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  final SupabaseClient _supabase;

  @override
  Future<List<UnitModel>> getUnits() async {
    return _supabase
        .from('unit')
        .select('id, name')
        .then((value) => value.map(UnitModel.fromJson).toList());
  }
}
