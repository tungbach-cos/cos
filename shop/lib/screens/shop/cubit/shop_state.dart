part of 'shop_cubit.dart';

/// States for shop screen
@Freezed(copyWith: false)
class ShopState with _$ShopState {
  /// Initial state before loading
  const factory ShopState.initial() = ShopInitial;

  /// Loading products
  const factory ShopState.loading() = ShopLoading;

  /// Products loaded successfully
  const factory ShopState.success({
    required List<ProductModel> products,
    required String selectedCategory,
    required String sortBy,
  }) = ShopSuccess;

  /// Error loading products
  const factory ShopState.failure(String error) = ShopFailure;
}
