import 'package:datasource/src/product/product_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:supabase/supabase.dart';

@Injectable(as: ProductDatasource)
final class ProductDatasourceImpl implements ProductDatasource {
  ProductDatasourceImpl({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  final SupabaseClient _supabase;

  @override
  Future<List<ProductModel>> getProducts() async {
    return _supabase
        .from('product')
        .select('*, category:category_id(id, name), unit:unit_id(id, name)')
        .then((value) => value.map(ProductModel.fromJson).toList());
  }
}
