import 'package:domain/src/category/exception/exception.dart';
import 'package:models/models.dart';

/// Repository interface for category data operations in the API.
abstract interface class CategoryRepository {
  /// Returns all categories.
  Future<List<CategoryModel>> getCategories();

  /// Returns a single category by [id].
  /// Throws [CategoryNotFoundException] if not found.
  Future<CategoryModel> getCategory({required int id});

  /// Creates a new category from [data].
  Future<CategoryModel> createCategory({required CategoryRequestModel data});

  /// Updates an existing category with [id] using [data].
  Future<CategoryModel> updateCategory({
    required int id,
    required CategoryRequestModel data,
  });

  /// Deletes the category with the given [id].
  Future<void> deleteCategory({required int id});
}
