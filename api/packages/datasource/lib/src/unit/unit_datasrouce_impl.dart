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

  @override
  Future<UnitModel?> getUnit({required int id}) async {
    final value = await _supabase
        .from('unit')
        .select('id, name')
        .eq('id', id)
        .maybeSingle();
    return value == null ? null : UnitModel.fromJson(value);
  }

  @override
  Future<UnitModel> createUnit({
    required Map<String, dynamic> data,
  }) async {
    final value = await _supabase
        .from('unit')
        .insert(data)
        .select('id, name')
        .single();
    return UnitModel.fromJson(value);
  }

  @override
  Future<UnitModel> updateUnit({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    final value = await _supabase
        .from('unit')
        .update(data)
        .eq('id', id)
        .select('id, name')
        .single();
    return UnitModel.fromJson(value);
  }

  @override
  Future<void> deleteUnit({required int id}) async {
    await _supabase.from('unit').delete().eq('id', id);
  }
}
