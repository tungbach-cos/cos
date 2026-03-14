import 'package:domain/src/product/exception/exception.dart';
import 'package:models/models.dart';

/// Repository interface for product data operations in the API.
abstract interface class ProductRepository {
  /// Returns all products.
  Future<List<ProductModel>> getProducts();

  /// Returns a single product by [id].
  /// Throws [ProductNotFoundException] if not found.
  Future<ProductModel> getProduct({required int id});

  /// Creates a new product from [data], optionally uploading [image] to
  /// storage and setting [data]'s image URL.
  Future<ProductModel> createProduct({
    required ProductRequestModel data,
    FileRequestModel? image,
  });

  /// Updates an existing product with [id] using [data], optionally
  /// uploading [image] to storage and setting the product's image URL.
  Future<ProductModel> updateProduct({
    required int id,
    required ProductRequestModel data,
    FileRequestModel? image,
  });

  /// Deletes a product by [id].
  Future<void> deleteProduct({required int id});
}
