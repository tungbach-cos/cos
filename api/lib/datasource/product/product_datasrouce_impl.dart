import 'package:models/models.dart';
import 'package:supabase/supabase.dart';
import 'package:tungbach/datasource/product/product_datasource.dart';

final class ProductDatasourceImpl implements ProductDatasource {
  ProductDatasourceImpl(this.supabase);

  final SupabaseClient supabase;

  @override
  Future<List<ProductModel>> getProducts() async {
    return supabase
        .from('product')
        .select('*, category:category_id(*), unit:unit_id(*)')
        .then((value) => value.map(ProductModel.fromJson).toList());
  }
}
