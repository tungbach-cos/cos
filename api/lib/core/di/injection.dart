import 'package:datasource/datasource.dart' show DatasourcePackageModule;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(DatasourcePackageModule),
  ],
)
void configureDependencies() => sl.init();
