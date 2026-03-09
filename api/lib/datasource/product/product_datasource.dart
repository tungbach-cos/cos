import 'package:tungbach/datasource/product/models/product_model.dart';

abstract interface class ProductDatasource {
  Future<List<ProductModel>> getProducts();
}
