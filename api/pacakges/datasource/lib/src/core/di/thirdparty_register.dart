import 'package:datasource/datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase/supabase.dart';

/// Injectable module for third-party dependencies used by the datasource
/// package. Follows the "registering third party types" pattern from
/// the Injectable docs:
/// https://pub.dev/packages/injectable#using-a-register-module-for-third-party-dependencies-2
@module
abstract class ThirdPartyRegister {
  /// Registers a [SupabaseClient] for use by injectables such as
  /// [ProductDatasource].
  @lazySingleton
  SupabaseClient get supabaseClient => SupabaseClient(
    'https://rxgthgfagjwshvbutpri.supabase.co',
    'sb_publishable_7c3ADXaT9Hz7AGRjDlLFKw_QahANbU_',
  );
}
