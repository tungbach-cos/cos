import 'package:datasource/datasource.dart';
import 'package:domain/src/category/category_repository.dart';
import 'package:domain/src/category/exception/exception.dart';
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
  Future<CategoryModel> getCategory({required int id}) async {
    final category = await _categoryDatasource.getCategory(id: id);
    if (category == null) throw CategoryNotFoundException(id: id);
    return category;
  }

  @override
  Future<CategoryModel> createCategory({
    required CategoryRequestModel data,
  }) => _categoryDatasource.createCategory(data: data.toJson());

  @override
  Future<CategoryModel> updateCategory({
    required int id,
    required CategoryRequestModel data,
  }) {
    final updateData = data.copyWith(updatedAt: DateTime.now().toUtc());
    return _categoryDatasource.updateCategory(
      id: id,
      data: updateData.toJson(),
    );
  }

  @override
  Future<void> deleteCategory({required int id}) =>
      _categoryDatasource.deleteCategory(id: id);
}
