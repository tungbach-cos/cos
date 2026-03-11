import 'package:models/models.dart';

abstract interface class ProductDatasource {
  Future<List<ProductModel>> getProducts();

  Future<ProductModel?> getProduct({required int id});

  Future<ProductModel> createProduct({required Map<String, dynamic> data});

  Future<ProductModel> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  });

  Future<void> deleteProduct({required int id});
}
