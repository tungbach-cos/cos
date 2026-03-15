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

  static const _query = '*';
  static const _table = 'unit';

  @override
  Future<List<UnitModel>> getUnits() async {
    return _supabase
        .from(_table)
        .select(_query)
        .then((value) => value.map(UnitModel.fromJson).toList());
  }

  @override
  Future<UnitModel?> getUnit({required int id}) async {
    final value = await _supabase
        .from(_table)
        .select(_query)
        .eq('id', id)
        .maybeSingle();
    return value == null ? null : UnitModel.fromJson(value);
  }

  @override
  Future<UnitModel> createUnit({
    required Map<String, dynamic> data,
  }) async {
    final value = await _supabase
        .from(_table)
        .insert(data)
        .select(_query)
        .single();
    return UnitModel.fromJson(value);
  }

  @override
  Future<UnitModel> updateUnit({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    final value = await _supabase
        .from(_table)
        .update(data)
        .eq('id', id)
        .select(_query)
        .single();
    return UnitModel.fromJson(value);
  }

  @override
  Future<void> deleteUnit({required int id}) async {
    await _supabase.from(_table).delete().eq('id', id);
  }
}
