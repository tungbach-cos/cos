import 'package:datasource/src/product/product_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:supabase/supabase.dart';

/// Supabase-backed implementation of [ProductDatasource].
@Injectable(as: ProductDatasource)
final class ProductDatasourceImpl implements ProductDatasource {
  /// Creates a [ProductDatasourceImpl] with the given [supabase] client.
  ProductDatasourceImpl({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  final SupabaseClient _supabase;

  static const _table = 'product';
  static const _query =
      '*, category:category_id(id, name), unit:unit_id(id, name)';

  @override
  Future<List<ProductModel>> getProducts() async {
    return _supabase
        .from(_table)
        .select(_query)
        .then((value) => value.map(ProductModel.fromJson).toList());
  }

  @override
  Future<ProductModel?> getProduct({required int id}) async {
    final value = await _supabase
        .from(_table)
        .select(_query)
        .eq('id', id)
        .maybeSingle();
    return value == null ? null : ProductModel.fromJson(value);
  }

  @override
  Future<ProductModel> createProduct({
    required Map<String, dynamic> data,
  }) async {
    final value = await _supabase
        .from(_table)
        .insert(data)
        .select(_query)
        .single();
    return ProductModel.fromJson(value);
  }

  @override
  Future<ProductModel> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    final value = await _supabase
        .from(_table)
        .update(data)
        .eq('id', id)
        .select(_query)
        .single();
    return ProductModel.fromJson(value);
  }

  @override
  Future<void> deleteProduct({required int id}) async {
    await _supabase.from(_table).delete().eq('id', id);
  }
}
