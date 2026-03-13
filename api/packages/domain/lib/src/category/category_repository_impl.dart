import 'package:datasource/datasource.dart';
import 'package:domain/src/category/category_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';

/// Default implementation of [CategoryRepository] backed by
/// [CategoryDatasource].
@Injectable(as: CategoryRepository)
final class CategoryRepositoryImpl implements CategoryRepository {
  /// Creates a [CategoryRepositoryImpl].
  CategoryRepositoryImpl({
    required CategoryDatasource categoryDatasource,
  }) : _categoryDatasource = categoryDatasource;

  final CategoryDatasource _categoryDatasource;

  @override
  Future<List<CategoryModel>> getCategories() =>
      _categoryDatasource.getCategories();

  @override
  Future<CategoryModel?> getCategory({required int id}) =>
      _categoryDatasource.getCategory(id: id);

  @override
  Future<CategoryModel> createCategory({
    required Map<String, dynamic> data,
  }) => _categoryDatasource.createCategory(data: data);

  @override
  Future<CategoryModel> updateCategory({
    required int id,
    required Map<String, dynamic> data,
  }) => _categoryDatasource.updateCategory(id: id, data: data);

  @override
  Future<void> deleteCategory({required int id}) =>
      _categoryDatasource.deleteCategory(id: id);
}
