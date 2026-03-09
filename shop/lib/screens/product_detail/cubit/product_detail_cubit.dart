import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tungbach/data/data.dart';

part 'product_detail_state.dart';
part 'product_detail_cubit.freezed.dart';

/// Cubit for managing product detail screen state
@injectable
class ProductDetailCubit extends Cubit<ProductDetailState> {
  /// Creates a product detail cubit
  ProductDetailCubit({
    required ProductRepository productRepository,
    required CompanyInfoRepository companyInfoRepository,
  }) : _productRepository = productRepository,
       _companyInfoRepository = companyInfoRepository,
       super(const ProductDetailState.initial());

  final ProductRepository _productRepository;
  final CompanyInfoRepository _companyInfoRepository;

  /// Loads product details by ID
  Future<void> loadProduct(String productId) async {
    emit(const ProductDetailState.loading());

    try {
      // Fetch product and company info in parallel
      final results = await Future.wait([
        _productRepository.getProductById(productId),
        _companyInfoRepository.getCompanyInfo(),
      ]);

      final product = results[0] as ProductModel;
      final companyInfo = results[1] as CompanyInfoModel;

      final relatedProducts = await _productRepository.getRelatedProducts(
        product,
      );

      if (!isClosed) {
        emit(
          ProductDetailState.success(
            product: product,
            relatedProducts: relatedProducts,
            companyInfo: companyInfo,
          ),
        );
      }
    } on Exception catch (e) {
      if (!isClosed) {
        emit(ProductDetailState.failure(e.toString()));
      }
    }
  }
}
