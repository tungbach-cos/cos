import 'package:datasource/src/category/category_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:supabase/supabase.dart';

/// Supabase-backed implementation of [CategoryDatasource].
@Injectable(as: CategoryDatasource)
final class CategoryDatasourceImpl implements CategoryDatasource {
  /// Creates a [CategoryDatasourceImpl] with the given [supabase] client.
  CategoryDatasourceImpl({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  final SupabaseClient _supabase;

  @override
  Future<List<CategoryModel>> getCategories() async {
    return _supabase
        .from('category')
        .select('id, name')
        .then((value) => value.map(CategoryModel.fromJson).toList());
  }

  @override
  Future<CategoryModel?> getCategory({required int id}) async {
    final value = await _supabase
        .from('category')
        .select('id, name')
        .eq('id', id)
        .maybeSingle();
    return value == null ? null : CategoryModel.fromJson(value);
  }

  @override
  Future<CategoryModel> createCategory({
    required Map<String, dynamic> data,
  }) async {
    final value = await _supabase
        .from('category')
        .insert(data)
        .select('id, name')
        .single();
    return CategoryModel.fromJson(value);
  }

  @override
  Future<CategoryModel> updateCategory({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    final value = await _supabase
        .from('category')
        .update(data)
        .eq('id', id)
        .select('id, name')
        .single();
    return CategoryModel.fromJson(value);
  }

  @override
  Future<void> deleteCategory({required int id}) async {
    await _supabase.from('category').delete().eq('id', id);
  }
}
