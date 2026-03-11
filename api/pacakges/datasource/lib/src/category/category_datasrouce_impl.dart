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
}
