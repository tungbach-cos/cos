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

  static const _productSelect =
      '*, category:category_id(id, name), unit:unit_id(id, name)';

  @override
  Future<List<ProductModel>> getProducts() async {
    return _supabase
        .from('product')
        .select(_productSelect)
        .then((value) => value.map(ProductModel.fromJson).toList());
  }

  @override
  Future<ProductModel?> getProduct({required int id}) async {
    final value = await _supabase
        .from('product')
        .select(_productSelect)
        .eq('id', id)
        .maybeSingle();
    return value == null ? null : ProductModel.fromJson(value);
  }

  @override
  Future<ProductModel> createProduct({
    required Map<String, dynamic> data,
  }) async {
    final value = await _supabase
        .from('product')
        .insert(data)
        .select(_productSelect)
        .single();
    return ProductModel.fromJson(value);
  }

  @override
  Future<ProductModel> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    final value = await _supabase
        .from('product')
        .update(data)
        .eq('id', id)
        .select(_productSelect)
        .single();
    return ProductModel.fromJson(value);
  }

  @override
  Future<void> deleteProduct({required int id}) async {
    await _supabase.from('product').delete().eq('id', id);
  }
}
