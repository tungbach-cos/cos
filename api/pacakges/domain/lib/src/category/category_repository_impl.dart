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
}
