import 'package:models/models.dart';

/// Data access contract for products.
abstract interface class ProductDatasource {
  /// Returns all products.
  Future<List<ProductModel>> getProducts();

  /// Returns a single product by [id] or `null` if it does not exist.
  Future<ProductModel?> getProduct({required int id});

  /// Creates a new product with the given [data].
  Future<ProductModel> createProduct({required Map<String, dynamic> data});

  /// Updates an existing product identified by [id] using [data].
  Future<ProductModel> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  });

  /// Deletes the product with the given [id].
  Future<void> deleteProduct({required int id});
}
