import 'package:datasource/datasource.dart' show DatasourcePackageModule;
import 'package:domain/domain.dart' show DomainPackageModule;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:tungbach/core/di/injection.config.dart';

/// Global service locator for the API.
final sl = GetIt.instance;

/// Configures dependency injection for the API.
@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(DatasourcePackageModule),
    ExternalModule(DomainPackageModule),
  ],
)
void configureDependencies() => sl.init();
