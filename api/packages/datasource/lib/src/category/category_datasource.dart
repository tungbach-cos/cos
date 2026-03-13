import 'package:models/models.dart';

/// Data access contract for product categories.
abstract interface class CategoryDatasource {
  /// Returns all categories from the backing store.
  Future<List<CategoryModel>> getCategories();

  /// Returns a single category by [id] or `null` if it does not exist.
  Future<CategoryModel?> getCategory({required int id});

  /// Creates a new category with the given [data].
  Future<CategoryModel> createCategory({required Map<String, dynamic> data});

  /// Updates an existing category identified by [id] using [data].
  Future<CategoryModel> updateCategory({
    required int id,
    required Map<String, dynamic> data,
  });

  /// Deletes the category with the given [id].
  Future<void> deleteCategory({required int id});
}
