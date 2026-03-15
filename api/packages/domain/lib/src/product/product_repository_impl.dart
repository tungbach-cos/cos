import 'package:datasource/datasource.dart';
import 'package:domain/src/product/exception/exception.dart';
import 'package:domain/src/product/product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';

/// Default implementation of [ProductRepository] backed by [ProductDatasource]
/// and [StorageDatasource].
@Injectable(as: ProductRepository)
final class ProductRepositoryImpl implements ProductRepository {
  /// Creates a [ProductRepositoryImpl].
  ProductRepositoryImpl({
    required ProductDatasource productDatasource,
    required StorageDatasource storageDatasource,
  }) : _productDatasource = productDatasource,
       _storageDatasource = storageDatasource;

  final ProductDatasource _productDatasource;
  final StorageDatasource _storageDatasource;

  @override
  Future<List<ProductModel>> getProducts() => _productDatasource.getProducts();

  @override
  Future<ProductModel> getProduct({required int id}) async {
    final product = await _productDatasource.getProduct(id: id);
    if (product == null) throw ProductNotFoundException(id: id);
    return product;
  }

  @override
  Future<ProductModel> createProduct({
    required ProductRequestModel data,
    FileRequestModel? image,
  }) async {
    var productData = data;
    if (image case FileRequestModel(
      :final name,
      :final bytes,
      :final contentType,
    ) when name.isNotEmpty && bytes.isNotEmpty) {
      final imageUrl = await _storageDatasource.uploadFile(
        bucket: StorageBucket.product,
        path: name,
        bytes: bytes,
        contentType: contentType,
      );
      productData = productData.copyWith(imageUrl: imageUrl);
    }
    return _productDatasource.createProduct(data: productData.toJson());
  }

  @override
  Future<ProductModel> updateProduct({
    required int id,
    required ProductRequestModel data,
    FileRequestModel? image,
  }) async {
    final ProductModel(
      id: productId,
      :name,
      category: CategoryModel(id: categoryId),
      unit: UnitModel(id: unitId),
      :sku,
      :fullDescription,
      :features,
      :specifications,
      :price,
      :imageUrl,
    ) = await getProduct(
      id: id,
    );
    var updateData = data.copyWith(updatedAt: DateTime.now().toUtc());
    if (image case FileRequestModel(
      :final bytes,
      :final contentType,
    ) when bytes.isNotEmpty) {
      final path = sku;
      final imageUrl = await _storageDatasource.uploadFile(
        bucket: StorageBucket.product,
        path: path,
        bytes: image.bytes,
        contentType: contentType,
      );
      updateData = updateData.copyWith(imageUrl: imageUrl);
    }
    return _productDatasource.updateProduct(
      id: id,
      data: updateData.toJson(),
    );
  }

  @override
  Future<void> deleteProduct({required int id}) async {
    final product = await getProduct(id: id);
    if (product case ProductModel(sku: String(isNotEmpty: true))) {
      await _storageDatasource.deleteFile(
        bucket: StorageBucket.product,
        path: product.sku,
      );
    }
    await _productDatasource.deleteProduct(id: id);
  }
}
