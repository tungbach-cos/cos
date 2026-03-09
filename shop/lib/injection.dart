import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tungbach/injection.config.dart';

/// Service locator instance
final GetIt getIt = GetIt.instance;

/// Initializes dependency injection
///
/// Call this in main() before runApp()
@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
