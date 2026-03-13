import 'package:datasource/datasource.dart';
import 'package:domain/src/product/product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';

/// Default implementation of [ProductRepository] backed by [ProductDatasource].
@Injectable(as: ProductRepository)
final class ProductRepositoryImpl implements ProductRepository {
  /// Creates a [ProductRepositoryImpl].
  ProductRepositoryImpl({required ProductDatasource productDatasource})
    : _productDatasource = productDatasource;

  final ProductDatasource _productDatasource;

  @override
  Future<List<ProductModel>> getProducts() => _productDatasource.getProducts();

  @override
  Future<ProductModel?> getProduct({required int id}) =>
      _productDatasource.getProduct(id: id);

  @override
  Future<ProductModel> createProduct({required Map<String, dynamic> data}) =>
      _productDatasource.createProduct(data: data);

  @override
  Future<ProductModel> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  }) => _productDatasource.updateProduct(id: id, data: data);

  @override
  Future<void> deleteProduct({required int id}) =>
      _productDatasource.deleteProduct(id: id);
}
