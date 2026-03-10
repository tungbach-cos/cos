import 'package:models/models.dart';

abstract interface class ProductDatasource {
  Future<List<ProductModel>> getProducts();
}
