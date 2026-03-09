---
name: dependency-injection
description: Dependency Injection with Injectable and GetIt for Flutter applications
---


# Dependency Injection with Injectable

## Overview

This project uses **Injectable** with **GetIt** for dependency injection, providing:
- Automatic dependency resolution
- Type-safe service locator
- Code generation for DI configuration
- Clear separation between layers

## Project Setup

### Required Packages
```yaml
dependencies:
  get_it: ^8.2.0
  injectable: ^2.5.0

dev_dependencies:
  injectable_generator: ^2.9.0
  build_runner: ^2.4.0
```

### Installation
```bash
fvm flutter pub add get_it injectable
fvm flutter pub add injectable_generator --dev
```

## Configuration Files

### 1. Service Locator Setup (`lib/injection.dart`)

```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// Service locator instance
final getIt = GetIt.instance;

/// Initializes dependency injection
///
/// Call this in main() before runApp()
@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
```

### 2. Main Entry Point (`lib/main.dart`)

```dart
import 'package:tungbach/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependency injection FIRST
  await configureDependencies();
  
  runApp(const Application());
}
```

### 3. Build Configuration (`build.yaml`) {#build-configuration}

```yaml
targets:
  $default:
    builders:
      injectable_generator:injectable:
        enabled: true
        generate_for:
          - lib/injection.dart
```

## Injectable Annotations

### For Data Layer (Repositories)

**Use `@Injectable()` - Creates new instance on each request**

```dart
import 'package:injectable/injectable.dart';

/// Repository for company information data
@Injectable()
class CompanyInfoRepository {
  CompanyInfoRepository();  // No const
  
  Future<CompanyInfoModel> getCompanyInfo() async {
    // Repository implementation
  }
}
```

**Why `@Injectable()` for repositories?**
- ✅ New instance per cubit - isolated state
- ✅ No shared state between screens
- ✅ Better for testing - fresh instance each time
- ✅ Follows stateless repository pattern

### For Presentation Layer (Cubits)

**Use `@injectable` - Creates new instance on each request**

```dart
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@injectable
class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const ProductDetailState.initial());

  final ProductRepository _productRepository;
  
  // Cubit methods...
}
```

**Constructor Requirements:**
- ✅ **MUST use named parameters** - `{required Type param}`
- ✅ Repository dependencies injected automatically
- ✅ Injectable resolves dependencies from service locator
- ❌ NO positional parameters for dependencies

### For Singletons (Rare - Global Services)

**Use `@lazySingleton` - Single instance, created on first use**

```dart
@lazySingleton
class AuthService {
  AuthService();
  
  // Global authentication state
}

@lazySingleton
class AppConfigService {
  AppConfigService();
  
  // Global app configuration
}
```

**When to use singletons:**
- ✅ Authentication services
- ✅ Global app configuration
- ✅ Logging services
- ✅ Analytics services
- ❌ NOT for repositories (use `@Injectable()`)
- ❌ NOT for cubits (use `@injectable`)

## Usage in Screens

### Screen with Cubit

```dart
import 'package:tungbach/injection.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({required this.productId, super.key});
  
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Use getIt to resolve cubit with all dependencies
      create: (context) => getIt<ProductDetailCubit>()..loadProduct(productId),
      child: const _ProductDetailContent(),
    );
  }
}
```

**Pattern:**
- ✅ Use `getIt<CubitType>()` instead of `context.read<Repository>()`
- ✅ Injectable automatically injects repository dependencies
- ✅ Call initialization method with `..methodName()`
- ✅ No manual dependency wiring needed

### Component with Cubit

```dart
class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CompanyInfoCubit>()..loadCompanyInfo(),
      child: const _FooterContent(),
    );
  }
}
```

## Dependency Resolution Flow

```
1. Screen creates BlocProvider
   ↓
2. BlocProvider calls getIt<CubitType>()
   ↓
3. Injectable resolves Cubit
   ↓
4. Injectable resolves Repository dependencies
   ↓
5. Injectable injects Repositories into Cubit
   ↓
6. Cubit instance returned to BlocProvider
```

## Code Generation

### Generate Injectable Configuration {#build-runner-commands}

```bash
# Generate dependency injection configuration
fvm dart run build_runner build -d

# Watch mode for continuous generation
fvm dart run build_runner watch -d

# Clean and rebuild
fvm dart run build_runner clean
fvm dart run build_runner build -d
```

**Generated files:**
- `lib/injection.config.dart` - DI configuration
- `lib/**/*.injectable.dart` - Injectable metadata

## Testing with Injectable

### Mock Dependencies in Tests

```dart
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late GetIt getIt;
  
  setUp(() {
    getIt = GetIt.asNewInstance();
    
    // Register mocks
    getIt.registerFactory<ProductRepository>(() => MockProductRepository());
    getIt.registerFactory<ProductDetailCubit>(
      () => ProductDetailCubit(
        productRepository: getIt<ProductRepository>(),
      ),
    );
  });
  
  tearDown(() {
    getIt.reset();
  });
  
  test('cubit loads product', () {
    final cubit = getIt<ProductDetailCubit>();
    // Test cubit...
  });
}
```

## Common Patterns

### Repository Registration

```dart
// All repositories use @Injectable()
@Injectable()
class UserRepository {
  UserRepository();
}

@Injectable()
class ProductRepository {
  ProductRepository();
}

@Injectable()
class OrderRepository {
  OrderRepository();
}
```

### Cubit with Multiple Dependencies

```dart
@injectable
class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({
    required ProductRepository productRepository,
    required UserRepository userRepository,
    required OrderRepository orderRepository,
  })  : _productRepository = productRepository,
        _userRepository = userRepository,
        _orderRepository = orderRepository,
        super(const CheckoutState.initial());

  final ProductRepository _productRepository;
  final UserRepository _userRepository;
  final OrderRepository _orderRepository;
  
  // Cubit methods...
}

// Usage in screen
BlocProvider(
  create: (context) => getIt<CheckoutCubit>()..loadCheckout(),
  child: const CheckoutContent(),
)
```

### Cubit with Parameters

```dart
// For cubits that need runtime parameters, use factory methods
@injectable
class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const ProductDetailState.initial());

  final ProductRepository _productRepository;
  
  // Initialize with parameter
  Future<void> loadProduct(String productId) async {
    // Implementation
  }
}

// Usage - pass parameter to initialization method
BlocProvider(
  create: (context) => getIt<ProductDetailCubit>()..loadProduct(productId),
  child: const Content(),
)
```

## Best Practices

### DO ✅

1. **Use `@Injectable()` for repositories** - New instance per request
2. **Use `@injectable` for cubits** - New instance per screen
3. **Use named parameters in constructors** - Required by Injectable
4. **Initialize DI in main() before runApp()** - Setup before app starts
5. **Use `getIt<Type>()` in BlocProvider** - Type-safe resolution
6. **Remove MultiRepositoryProvider** - GetIt handles DI
7. **Keep dependency graph acyclic** - No circular dependencies

### DON'T ❌

1. **DON'T use `@lazySingleton` for repositories** - Use `@Injectable()`
2. **DON'T use `@lazySingleton` for cubits** - Use `@injectable`
3. **DON'T use positional parameters** - Use named parameters
4. **DON'T use `context.read<Repository>()`** - Use `getIt<Cubit>()`
5. **DON'T manually wire dependencies** - Let Injectable handle it
6. **DON'T create circular dependencies** - A → B → A
7. **DON'T register in multiple places** - One annotation per class

## Architecture Integration

### Data Layer

```dart
// lib/data/repositories/product_repository.dart
@Injectable()  // ← New instance per request
class ProductRepository {
  ProductRepository();
  
  Future<List<ProductModel>> getAllProducts() async { }
}
```

### Presentation Layer

```dart
// lib/screens/shop/cubit/shop_cubit.dart
@injectable  // ← New instance per request
class ShopCubit extends Cubit<ShopState> {
  ShopCubit({
    required ProductRepository productRepository,  // ← Named parameter
  })  : _productRepository = productRepository,
        super(const ShopState.initial());

  final ProductRepository _productRepository;
}

// lib/screens/shop/view/shop_screen.dart
class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShopCubit>()..loadProducts(),
      child: const ShopContent(),
    );
  }
}
```

## Migration Checklist

When adding Injectable to existing project:

- [ ] Install packages: `get_it`, `injectable`, `injectable_generator`
- [ ] Create `lib/injection.dart` with `@InjectableInit()`
- [ ] Update `build.yaml` with injectable_generator configuration
- [ ] Annotate all repositories with `@Injectable()`
- [ ] Annotate all cubits with `@injectable`
- [ ] Ensure all cubit constructors use **named parameters**
- [ ] Update `main.dart` to call `configureDependencies()`
- [ ] Remove `MultiRepositoryProvider` from Application
- [ ] Replace `context.read<Repository>()` with `getIt<Cubit>()`
- [ ] Run `fvm dart run build_runner build -d`
- [ ] Test app runs without DI errors
- [ ] Update cursor rules with Injectable patterns

## Common Errors and Solutions

### Error: "No registered instance"

**Problem:** Forgot to run code generation

**Solution:**
```bash
fvm dart run build_runner build -d
```

### Error: "Type is not registered"

**Problem:** Missing `@Injectable()` or `@injectable` annotation

**Solution:** Add annotation to class
```dart
@Injectable()  // For repositories
@injectable    // For cubits
class MyClass { }
```

### Error: "Can't resolve dependencies"

**Problem:** Circular dependency or missing registration

**Solution:** 
- Check for circular dependencies (A → B → A)
- Ensure all dependencies are annotated
- Run build_runner again

### Error: "Expected named parameters"

**Problem:** Using positional parameters in constructor

**Solution:** Use named parameters
```dart
// ❌ BAD
MyCubit(this._repository) : super(initial);

// ✅ GOOD
MyCubit({
  required Repository repository,
})  : _repository = repository,
      super(initial);
```

## Summary

**Key Points:**
- ✅ Use `@Injectable()` for data layer (repositories) - New instance each time
- ✅ Use `@injectable` for presentation layer (cubits) - New instance each time
- ✅ Use `@lazySingleton` only for global services (auth, config, logging)
- ✅ All constructor parameters must be named: `{required Type param}`
- ✅ Use `getIt<Type>()` to resolve dependencies in BlocProvider
- ✅ Initialize DI in `main()` before `runApp()`
- ✅ Run `fvm dart run build_runner build -d` after changes

**Benefits:**
- 🚀 Automatic dependency resolution
- 🎯 Type-safe dependency injection
- 🧪 Easy mocking for tests
- 📦 Clear dependency graph
- ♻️ Consistent pattern across app
- 🔧 No manual wiring needed
