import 'package:datasource/datasource.dart';
import 'package:injectable/injectable.dart';

/// Entry point for initializing the domain micro package.
@InjectableInit.microPackage(
  ignoreUnregisteredTypes: [
    CategoryDatasource,
    ProductDatasource,
    UnitDatasource,
    StorageDatasource,
  ],
)
void initDomainMicroPackage() {}
