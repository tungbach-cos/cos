import 'package:models/models.dart';

/// Data access contract for product categories.
abstract interface class CategoryDatasource {
  /// Returns all categories from the backing store.
  Future<List<CategoryModel>> getCategories();
}
