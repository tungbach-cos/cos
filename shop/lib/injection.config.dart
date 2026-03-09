// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tungbach/components/footer/cubit/company_info_cubit.dart'
    as _i759;
import 'package:tungbach/data/data.dart' as _i501;
import 'package:tungbach/data/repositories/company_info/company_info_repository.dart'
    as _i862;
import 'package:tungbach/data/repositories/company_info/company_info_repository_impl.dart'
    as _i1058;
import 'package:tungbach/data/repositories/privacy_policy/privacy_policy_repository.dart'
    as _i134;
import 'package:tungbach/data/repositories/privacy_policy/privacy_policy_repository_impl.dart'
    as _i489;
import 'package:tungbach/data/repositories/product/product_repository_impl.dart'
    as _i225;
import 'package:tungbach/data/repositories/product/product_repository_interface.dart'
    as _i216;
import 'package:tungbach/data/repositories/terms_of_service/terms_of_service_repository.dart'
    as _i908;
import 'package:tungbach/data/repositories/terms_of_service/terms_of_service_repository_impl.dart'
    as _i897;
import 'package:tungbach/screens/privacy_policy/cubit/privacy_policy_cubit.dart'
    as _i855;
import 'package:tungbach/screens/product_detail/cubit/product_detail_cubit.dart'
    as _i623;
import 'package:tungbach/screens/shop/cubit/shop_cubit.dart' as _i654;
import 'package:tungbach/screens/terms_of_service/cubit/terms_of_service_cubit.dart'
    as _i898;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i862.CompanyInfoRepository>(
      () => _i1058.CompanyInfoRepositoryImpl(),
    );
    gh.factory<_i134.PrivacyPolicyRepository>(
      () => _i489.PrivacyPolicyRepositoryImpl(),
    );
    gh.factory<_i216.ProductRepository>(() => _i225.ProductRepositoryImpl());
    gh.factory<_i908.TermsOfServiceRepository>(
      () => _i897.TermsOfServiceRepositoryImpl(),
    );
    gh.factory<_i759.CompanyInfoCubit>(
      () =>
          _i759.CompanyInfoCubit(repository: gh<_i501.CompanyInfoRepository>()),
    );
    gh.factory<_i654.ShopCubit>(
      () => _i654.ShopCubit(productRepository: gh<_i501.ProductRepository>()),
    );
    gh.factory<_i623.ProductDetailCubit>(
      () => _i623.ProductDetailCubit(
        productRepository: gh<_i501.ProductRepository>(),
        companyInfoRepository: gh<_i501.CompanyInfoRepository>(),
      ),
    );
    gh.factory<_i898.TermsOfServiceCubit>(
      () => _i898.TermsOfServiceCubit(
        termsRepository: gh<_i501.TermsOfServiceRepository>(),
        companyRepository: gh<_i501.CompanyInfoRepository>(),
      ),
    );
    gh.factory<_i855.PrivacyPolicyCubit>(
      () => _i855.PrivacyPolicyCubit(
        policyRepository: gh<_i501.PrivacyPolicyRepository>(),
        companyRepository: gh<_i501.CompanyInfoRepository>(),
      ),
    );
    return this;
  }
}
