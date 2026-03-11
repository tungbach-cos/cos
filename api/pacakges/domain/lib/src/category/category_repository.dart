import 'package:models/models.dart';

/// Repository interface for category data operations in the API.
abstract interface class CategoryRepository {
  /// Returns all categories.
  Future<List<CategoryModel>> getCategories();
}
