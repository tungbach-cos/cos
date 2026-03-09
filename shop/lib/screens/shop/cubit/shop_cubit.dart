import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tungbach/data/data.dart';

part 'shop_state.dart';
part 'shop_cubit.freezed.dart';

/// Cubit for managing shop screen state
@injectable
class ShopCubit extends Cubit<ShopState> {
  /// Creates a shop cubit
  ShopCubit({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository,
       super(const ShopState.initial());

  final ProductRepository _productRepository;
  List<ProductModel> _allProducts = [];

  /// Loads all products
  Future<void> loadProducts() async {
    emit(const ShopState.loading());

    try {
      final products = await _productRepository.getAllProducts();
      _allProducts = products;

      if (!isClosed) {
        emit(
          ShopState.success(
            products: products,
            selectedCategory: 'Tất cả',
            sortBy: 'name',
          ),
        );
      }
    } on Exception catch (e) {
      if (!isClosed) {
        emit(ShopState.failure(e.toString()));
      }
    }
  }

  /// Filters products by category
  void filterByCategory(String category) {
    final currentState = state;
    if (currentState is! ShopSuccess) return;

    final filteredProducts = category == 'Tất cả'
        ? List<ProductModel>.from(_allProducts)
        : _allProducts
              .where((product) => product.category == category)
              .toList();

    // Apply current sorting
    _sortProducts(filteredProducts, currentState.sortBy);

    if (!isClosed) {
      emit(
        ShopState.success(
          products: filteredProducts,
          selectedCategory: category,
          sortBy: currentState.sortBy,
        ),
      );
    }
  }

  /// Sorts products
  void sortProducts(String sortBy) {
    final currentState = state;
    if (currentState is! ShopSuccess) return;

    final products = List<ProductModel>.from(currentState.products);
    _sortProducts(products, sortBy);

    if (!isClosed) {
      emit(
        ShopState.success(
          products: products,
          selectedCategory: currentState.selectedCategory,
          sortBy: sortBy,
        ),
      );
    }
  }

  /// Helper method to sort products
  void _sortProducts(List<ProductModel> products, String sortBy) {
    switch (sortBy) {
      case 'name':
        products.sort((a, b) => a.name.compareTo(b.name));
      case 'category':
        products.sort((a, b) => a.category.compareTo(b.category));
      default:
        break;
    }
  }
}
