import 'package:tungbach/data/models/product_model.dart';

/// Repository interface for product data operations.
///
/// Defines the contract for accessing product data.
/// This allows for easy testing and different implementations
/// (mock, API, database, etc.).
abstract interface class ProductRepository {
  /// Get all available products
  ///
  /// Returns a list of all products in the system.
  /// In a real app, this might fetch from:
  /// - Remote API: GET /api/products
  /// - Local database: SELECT * FROM products
  /// - CMS (Content Management System): GET /api/cms/products
  /// - Static files: /assets/data/products.json
  Future<List<ProductModel>> getAllProducts();

  /// Get a specific product by ID
  ///
  /// Returns a single product with the given ID.
  /// Throws an exception if the product is not found.
  /// In a real app, this might query:
  /// - Database: SELECT * FROM products WHERE id = ?
  /// - API endpoint: GET /api/products/{id}
  /// - Cache: products[id]
  Future<ProductModel> getProductById(String id);

  /// Get products filtered by category
  ///
  /// Returns products that belong to the specified category.
  /// In a real app, this might query:
  /// - Database: SELECT * FROM products WHERE category = ?
  /// - API: GET /api/products?category={category}
  /// - Search index: products where category matches
  Future<List<ProductModel>> getProductsByCategory(String category);

  /// Get related products for a given product
  ///
  /// Returns products in the same category as the given product.
  /// In a real app, this might query:
  /// - Database: SELECT * FROM products WHERE category = ? AND id != ?
  /// - API: GET /api/products/{id}/related
  /// - Recommendation engine: getSimilarProducts(productId)
  Future<List<ProductModel>> getRelatedProducts(ProductModel product);
}
