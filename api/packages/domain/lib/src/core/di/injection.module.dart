//@GeneratedMicroModule;DomainPackageModule;package:domain/src/core/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:datasource/datasource.dart' as _i351;
import 'package:domain/src/category/category_repository.dart' as _i638;
import 'package:domain/src/category/category_repository_impl.dart' as _i957;
import 'package:domain/src/product/product_repository.dart' as _i441;
import 'package:domain/src/product/product_repository_impl.dart' as _i860;
import 'package:domain/src/unit/unit_repository.dart' as _i597;
import 'package:domain/src/unit/unit_repository_impl.dart' as _i422;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i638.CategoryRepository>(() => _i957.CategoryRepositoryImpl(
        categoryDatasource: gh<_i351.CategoryDatasource>()));
    gh.factory<_i441.ProductRepository>(() => _i860.ProductRepositoryImpl(
          productDatasource: gh<_i351.ProductDatasource>(),
          storageDatasource: gh<_i351.StorageDatasource>(),
        ));
    gh.factory<_i597.UnitRepository>(() =>
        _i422.UnitRepositoryImpl(unitDatasource: gh<_i351.UnitDatasource>()));
  }
}
