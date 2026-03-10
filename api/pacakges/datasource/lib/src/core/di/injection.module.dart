//@GeneratedMicroModule;DatasourcePackageModule;package:datasource/src/core/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:datasource/src/core/di/thirdparty_register.dart' as _i475;
import 'package:datasource/src/product/product_datasource.dart' as _i445;
import 'package:datasource/src/product/product_datasrouce_impl.dart' as _i271;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase/supabase.dart' as _i590;

class DatasourcePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final thirdPartyRegister = _$ThirdPartyRegister();
    gh.lazySingleton<_i590.SupabaseClient>(
        () => thirdPartyRegister.supabaseClient);
    gh.factory<_i445.ProductDatasource>(() =>
        _i271.ProductDatasourceImpl(supabase: gh<_i590.SupabaseClient>()));
  }
}

class _$ThirdPartyRegister extends _i475.ThirdPartyRegister {}
