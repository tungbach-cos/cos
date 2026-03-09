part of 'product_detail_cubit.dart';

/// States for product detail screen
@Freezed(copyWith: false)
sealed class ProductDetailState with _$ProductDetailState {
  /// Initial state before loading
  const factory ProductDetailState.initial() = ProductDetailInitial;

  /// Loading product data
  const factory ProductDetailState.loading() = ProductDetailLoading;

  /// Product loaded successfully
  const factory ProductDetailState.success({
    required ProductModel product,
    required List<ProductModel> relatedProducts,
    required CompanyInfoModel companyInfo,
  }) = ProductDetailSuccess;

  /// Product not found
  const factory ProductDetailState.notFound() = ProductDetailNotFound;

  /// Error loading product
  const factory ProductDetailState.failure(String error) = ProductDetailFailure;
}
