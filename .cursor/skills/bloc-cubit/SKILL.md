---
name: bloc-cubit
description: Bloc and Cubit state management best practices based on bloc_lint
---


# Bloc and Cubit Rules

## Project Setup
- This project uses FVM, so use `fvm flutter pub add` or `fvm dart pub add` for dependencies
- Add `bloc`, `flutter_bloc`, `get_it`, and `injectable` as dependencies
- Add `freezed_annotation` as dependency for state classes
- Add `freezed`, `build_runner`, `injectable_generator`, and `bloc_test` as dev dependencies

### Build Runner Commands
**See: [Dependency Injection Rules](dependency_injection.mdc#build-runner-commands) for complete build runner setup**

```bash
# Watch mode (RECOMMENDED) - auto-generates on file changes
fvm dart run build_runner watch -d

# One-time build (with debug mode)
fvm dart run build_runner build -d

# Clean and rebuild
fvm dart run build_runner clean
fvm dart run build_runner build -d
```

### build.yaml Configuration
**See: [Dependency Injection Rules](dependency_injection.mdc#build-configuration) for complete build configuration**

Create `build.yaml` in project root to optimize Freezed:
```yaml
targets:
  $default:
    builders:
      freezed:
        enabled: true
        generate_for:
          - lib/**/*_state.dart
          - lib/**/*_cubit.dart
          - lib/**/*_model.dart  # Include models for data layer
```

## General Principles

### Prefer Cubit Over Bloc
- **Use `Cubit` instead of `Bloc` for simple state management**
- Cubits are simpler and more straightforward when you don't need event-driven architecture
- Only use `Bloc` when you need:
  - Event transformations (debounce, throttle, etc.)
  - Complex event handling logic
  - Event replay or event sourcing
  - Multiple events that map to the same state change

**Good (Cubit):**
```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
```

**Avoid (unless complex event handling needed):**
```dart
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
  }
}
```

## Naming Conventions

### Cubit Naming
- Name cubits with `Cubit` suffix: `AuthCubit`, `CounterCubit`, `UserProfileCubit`
- Use descriptive names that indicate the domain or feature

### Bloc Naming (when used)
- Name blocs with `Bloc` suffix: `AuthBloc`, `PaymentBloc`
- Name events with descriptive action names: `LoginRequested`, `LogoutRequested`
- Name states with descriptive status names: `AuthInitial`, `AuthLoading`, `AuthSuccess`, `AuthFailure`

### State Naming
- Use descriptive state class names that indicate the status
- For simple states, consider using sealed classes or enums
- Use `Initial`, `Loading`, `Success`, `Failure` patterns for async operations

## State Design

### Immutable States with Freezed (RECOMMENDED)
- **Use Freezed for state classes** - Automatic immutability and code generation
- Freezed generates `copyWith`, equality, `toString`, and pattern matching
- Use `@freezed` annotation on state classes
- Run `fvm dart run build_runner build -d` for code generation
- Use `when` and `maybeWhen` for exhaustive pattern matching
- **Use `@Freezed(copyWith: false)` if you don't need copyWith** - Eliminates unused field warnings
- **State files MUST use `part of` directive** - State files are part of the cubit module

**Good (Freezed with part directive - for cubit state files):**
```dart
// In cubit file (e.g., shop_cubit.dart)
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tungbach/data/data.dart';

part 'shop_state.dart';
part 'shop_cubit.freezed.dart';

@injectable
class ShopCubit extends Cubit<ShopState> {
  // ... cubit implementation
}
```

```dart
// In state file (e.g., shop_state.dart)
part of 'shop_cubit.dart';

@Freezed(copyWith: false)
class ShopState with _$ShopState {
  const factory ShopState.initial() = ShopInitial;
  const factory ShopState.loading() = ShopLoading;
  const factory ShopState.success({
    required List<ProductModel> products,
    required String selectedCategory,
    required String sortBy,
  }) = ShopSuccess;
  const factory ShopState.failure(String error) = ShopFailure;
}
```

**Good (Freezed without copyWith - for simple union types):**
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part of 'user_cubit.dart';

@Freezed(copyWith: false)
class UserState with _$UserState {
  const factory UserState.initial() = UserInitial;
  const factory UserState.loading() = UserLoading;
  const factory UserState.success(User user) = UserSuccess;
  const factory UserState.failure(String error) = UserFailure;
}
```

**Good (Freezed with copyWith - when you need to update state properties):**
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required List<Product> items,
    required double total,
    @Default(false) bool isLoading,
  }) = _CartState;
}

// Usage: state.copyWith(isLoading: true)
```

### Alternative: Manual Equatable (if not using Freezed)
- **Always make state classes immutable**
- Use `final` fields for all state properties
- Implement `copyWith` method for updating states
- Use `Equatable` or override `==` and `hashCode` for proper equality checks

```dart
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState({
    required this.user,
    required this.status,
    this.error,
  });

  final User? user;
  final UserStatus status;
  final String? error;

  UserState copyWith({
    User? user,
    UserStatus? status,
    String? error,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [user, status, error];
}
```

### Sealed Classes for States
- Use sealed classes for states with Dart 3+ for exhaustive pattern matching
- This prevents missing state cases in your UI

```dart
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthAuthenticated extends AuthState {
  AuthAuthenticated(this.user);
  final User user;
}

final class AuthUnauthenticated extends AuthState {
  AuthUnauthenticated([this.error]);
  final String? error;
}
```

## Cubit/Bloc Implementation

### Avoid Public Methods on Bloc
- **Do not expose public methods on Bloc classes**
- All interactions should go through events
- This maintains the event-driven architecture

**Bad:**
```dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // Don't do this!
  void login(String email, String password) {
    add(LoginRequested(email, password));
  }
}
```

**Good:**
```dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    // Handle login
  }
}

// Usage: authBloc.add(LoginRequested(email, password))
```

### Private Event Handlers
- Make event handler methods private (prefix with `_`)
- Use descriptive names: `_onEventName`

### Async Operations
- Use `async` event handlers for async operations
- Always emit loading states before async operations
- Handle errors gracefully and emit failure states

```dart
class DataCubit extends Cubit<DataState> {
  DataCubit(this._repository) : super(const DataInitial());

  final DataRepository _repository;

  Future<void> loadData() async {
    emit(const DataLoading());
    try {
      final data = await _repository.fetchData();
      emit(DataSuccess(data));
    } catch (e) {
      emit(DataFailure(e.toString()));
    }
  }
}
```

### Avoid Unsafe State Access
- **Never access `state` after `await` without checking if cubit is closed**
- Check `isClosed` before emitting after async operations

```dart
// Good
Future<void> loadData() async {
  emit(LoadingState());
  try {
    final data = await repository.fetch();
    if (!isClosed) {
      emit(SuccessState(data));
    }
  } catch (e) {
    if (!isClosed) {
      emit(ErrorState(e));
    }
  }
}
```

### Emit Complete States
- **Always emit complete states, not partial ones**
- Use `copyWith` to update only changed properties
- Don't emit intermediate states unless they're meaningful

```dart
// Good
Future<void> updateUser(User user) async {
  emit(state.copyWith(status: UserStatus.updating));
  try {
    await repository.updateUser(user);
    emit(state.copyWith(
      user: user,
      status: UserStatus.updated,
    ));
  } catch (e) {
    emit(state.copyWith(
      status: UserStatus.error,
      error: e.toString(),
    ));
  }
}
```

## Dependency Injection

**See: [Dependency Injection Rules](dependency_injection.mdc) for complete DI setup and patterns**

### Constructor Injection with Injectable

**CRITICAL RULES:**
- **All cubit constructors MUST use named parameters**
- **All cubit instances MUST be created with `getIt<CubitType>()`**
- **NEVER manually instantiate cubits or use `context.read<Repository>()`**

```dart
import 'package:injectable/injectable.dart';

@injectable  // ← Required for dependency injection
class UserCubit extends Cubit<UserState> {
  UserCubit({
    required UserRepository repository,      // ← Named parameter
    required AuthService authService,         // ← Named parameter
  })  : _repository = repository,
        _authService = authService,
        super(const UserInitial());

  final UserRepository _repository;
  final AuthService _authService;
}
```

**Usage in screens:**
```dart
import 'package:tungbach/injection.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserCubit>()..loadUser(),
      child: const UserContent(),
    );
  }
}
```

**Rules:**
- ✅ Annotate all cubits with `@injectable`
- ✅ Use **named parameters** in constructor: `{required Type param}`
- ✅ **ALWAYS use `getIt<CubitType>()` to create cubit instances**
- ✅ Injectable automatically injects repositories
- ✅ Import `import 'package:tungbach/injection.dart';` in screens/components
- ❌ NO positional parameters for dependencies
- ❌ NO manual `context.read<Repository>()` - use getIt instead
- ❌ NO manual cubit instantiation - use getIt instead
- ❌ NO manual dependency wiring

### Barrel File Import Rules

**CRITICAL: Use specific imports for repository interfaces, NOT barrel files**

#### ✅ **CORRECT - Import repository interfaces directly:**
```dart
// In cubit files - import the interface directly
import 'package:tungbach/data/repositories/company_info_repository/company_info_repository.dart';
import 'package:tungbach/data/repositories/product_repository/product_repository.dart';
import 'package:tungbach/data/repositories/privacy_policy_repository/privacy_policy_repository.dart';
import 'package:tungbach/data/repositories/terms_of_service_repository/terms_of_service_repository.dart';

@injectable
class MyCubit extends Cubit<MyState> {
  MyCubit({
    required CompanyInfoRepository companyRepository,
    required ProductRepository productRepository,
  }) : _companyRepository = companyRepository,
       _productRepository = productRepository,
       super(const MyState.initial());

  final CompanyInfoRepository _companyRepository;
  final ProductRepository _productRepository;
}
```

#### ❌ **WRONG - Don't use barrel files for repository interfaces:**
```dart
// ❌ BAD - Using barrel files for repository interfaces
import 'package:tungbach/data/repositories/repositories.dart';
import 'package:tungbach/data/data.dart';

// ❌ BAD - This creates circular dependencies and import issues
```

#### ✅ **CORRECT - Use data.dart for files outside data/ folder:**
```dart
// ✅ GOOD - Use data.dart when importing from outside the data/ folder
import 'package:tungbach/data/data.dart';

// This imports all models from the data layer via data.dart
```

#### **Import Rules Summary:**
- ✅ **Repository interfaces**: Import directly from specific files
- ✅ **Models**: Use `data.dart` when importing from outside `data/` folder
- ✅ **Cubits**: Import directly (no barrel files for cubits)
- ✅ **Screens**: Import cubit and state files directly
- ✅ **General rule**: Use `data.dart` for models when outside data layer
- ❌ **NO barrel files for repository interfaces** - causes circular dependencies
- ❌ **NO `repositories.dart` imports in cubits** - use specific repository interfaces

#### **Import Path Rules:**
- ✅ **Files outside `data/` folder**: Use `data.dart` for models
- ✅ **Files inside `data/` folder**: Use direct paths like `models/models.dart`
- ✅ **Repository interfaces**: Always import directly from specific files
- ✅ **Example**: Use `data.dart` when importing from `lib/screens/` or `lib/components/`
- ✅ **Example**: Use `models/models.dart` when importing from `lib/data/repositories/`
- ❌ **Avoid indirect imports** through multiple barrel files
- ❌ **Don't use parent barrel files** when child barrel files exist

#### **Why This Matters:**
- ✅ **Prevents circular dependencies** between data and presentation layers
- ✅ **Clear dependency graph** - cubits depend on interfaces, not implementations
- ✅ **Better testability** - easy to mock specific repository interfaces
- ✅ **Cleaner imports** - explicit about what each cubit depends on
- ✅ **Shorter import paths** - more direct and readable
- ❌ **Avoids import hell** - barrel files can create complex dependency chains

### Repository Pattern
- Use repository pattern to separate data layer from business logic
- Repositories are annotated with `@Injectable()` for automatic registration
- Cubits/Blocs should only handle business logic and state management

## Resource Management

### Close Method
- Override `close()` to clean up resources
- Cancel subscriptions and close streams
- Call `super.close()` at the end

```dart
class DataCubit extends Cubit<DataState> {
  DataCubit(this._repository) : super(const DataInitial()) {
    _subscription = _repository.dataStream.listen(_onDataReceived);
  }

  final DataRepository _repository;
  StreamSubscription? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
```

## UI Integration

### BlocProvider (CRITICAL - SCOPE MANAGEMENT)

**IMPORTANT: Provide Cubits/Blocs at the appropriate scope**

- ✅ **PREFER**: Provide at **page/screen level** for page-specific state
- ✅ **PREFER**: Provide at **widget level** for widget-specific state
- ❌ **AVOID**: Global provision unless truly global (auth, theme, etc.)
- Don't create cubit/bloc in build method

**File Structure Rules:**
1. **Page-specific cubit** (used by ONE screen only):
   - Location: `lib/screens/[screen_name]/cubit/`
   - Example: `lib/screens/contact/cubit/contact_form_cubit.dart`
   
2. **Shared cubit** (used by MULTIPLE screens):
   - Location: `lib/cubits/[feature_name]/`
   - Example: `lib/cubits/company_info/company_info_cubit.dart`
   
3. **Global cubit** (auth, theme, user session):
   - Location: `lib/cubits/[feature_name]/`
   - Provided: In Application root

**Scoping Rules:**
1. **Page-specific state** → Cubit in `screens/[page]/cubit/`, provide in screen widget
2. **Shared state** (multiple pages) → Cubit in `cubits/[feature]/`, provide per page
3. **Global state** (auth, theme, user) → Cubit in `cubits/[feature]/`, provide in Application
4. **Widget-local state** → Use StatefulWidget or local ValueNotifier

**Example 1: Page-specific Cubit (in screen folder)**
```dart
// File: lib/screens/contact/cubit/contact_form_cubit.dart
import 'package:injectable/injectable.dart';

@injectable
class ContactFormCubit extends Cubit<ContactFormState> {
  ContactFormCubit() : super(const ContactFormInitial());
  
  void submitForm(ContactFormData data) async {
    emit(const ContactFormSubmitting());
    // ... handle submission
  }
}

// File: lib/screens/contact/view/contact_screen.dart
import 'package:tungbach/injection.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ContactFormCubit>(),
      child: Scaffold(body: ContactContent()),
    );
  }
}
```

**Example 2: Global Cubit (Application level) - RARE**
```dart
// File: lib/cubits/auth/auth_cubit.dart
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required AuthRepository repository,
  })  : _repository = repository,
        super(const AuthInitial());

  final AuthRepository _repository;
  // ... implementation
}

// File: lib/application.dart
import 'package:tungbach/injection.dart';

// ONLY for auth, theme, user session, locale, etc.
MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => getIt<AuthCubit>(),
    ),
    // DON'T add page-specific cubits here!
  ],
  child: MaterialApp.router(...),
)
```

### BlocBuilder
- Use `BlocBuilder` to rebuild UI based on state
- Keep builder functions small and focused
- Consider using `buildWhen` to control rebuilds

**With Freezed states - use `when` or `maybeWhen`:**
```dart
BlocBuilder<UserCubit, UserState>(
  builder: (context, state) {
    return state.when(
      initial: () => const Text('Not loaded'),
      loading: () => const CircularProgressIndicator(),
      success: (user) => Text(user.name),
      failure: (error) => Text('Error: $error'),
    );
  },
)

// Or use maybeWhen for partial matching
BlocBuilder<UserCubit, UserState>(
  builder: (context, state) {
    return state.maybeWhen(
      success: (user) => UserProfile(user: user),
      orElse: () => const CircularProgressIndicator(),
    );
  },
)
```

**With Equatable states - use `is` checks:**
```dart
BlocBuilder<UserCubit, UserState>(
  buildWhen: (previous, current) => previous.user != current.user,
  builder: (context, state) {
    if (state is UserSuccess) {
      return Text(state.user.name);
    }
    return const Text('Unknown');
  },
)
```

### BlocListener
- Use `BlocListener` for side effects (navigation, dialogs, snackbars)
- Don't rebuild UI in listener
- Use `listenWhen` to control when listener is called

```dart
BlocListener<AuthCubit, AuthState>(
  listenWhen: (previous, current) => current is AuthUnauthenticated,
  listener: (context, state) {
    Navigator.of(context).pushReplacementNamed('/login');
  },
  child: ChildWidget(),
)
```

### BlocConsumer
- Use `BlocConsumer` when you need both builder and listener
- Combines `BlocBuilder` and `BlocListener`

```dart
BlocConsumer<CartCubit, CartState>(
  listener: (context, state) {
    if (state.status == CartStatus.checkoutSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Checkout successful!')),
      );
    }
  },
  builder: (context, state) {
    return CartView(items: state.items);
  },
)
```

## Testing

### Unit Testing Cubits
- Use `bloc_test` package for testing
- Test initial state
- Test all state transitions
- Test error cases

```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('initial state is 0', () {
      expect(counterCubit.state, 0);
    });

    blocTest<CounterCubit, int>(
      'emits [1] when increment is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [1],
    );

    blocTest<CounterCubit, int>(
      'emits [-1] when decrement is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [-1],
    );
  });
}
```

### Mock Dependencies
- Mock repositories and services in tests
- Use `mocktail` or `mockito` for mocking

```dart
class MockUserRepository extends Mock implements UserRepository {}

blocTest<UserCubit, UserState>(
  'emits [loading, success] when loadUser succeeds',
  build: () {
    final repository = MockUserRepository();
    when(() => repository.getUser()).thenAnswer(
      (_) async => User(id: '1', name: 'Test'),
    );
    return UserCubit(repository: repository);
  },
  act: (cubit) => cubit.loadUser(),
  expect: () => [
    const UserState(status: UserStatus.loading),
    UserState(
      status: UserStatus.success,
      user: User(id: '1', name: 'Test'),
    ),
  ],
);
```

## Common Anti-Patterns to Avoid

### Don't Use Cubit/Bloc for Local UI State
- Don't use cubit/bloc for simple local UI state like text field values
- Use `StatefulWidget` or `ValueNotifier` for local state

### Don't Emit States in Build Method
- Never call cubit methods that emit states directly in build method
- This causes infinite rebuild loops

### Don't Create New Cubit Instances in Build
- Always provide cubit/bloc through `BlocProvider`
- Don't create instances in build method

### Don't Over-scope Cubits/Blocs
- **Don't provide page-specific cubits globally** in Application
- Each page should provide its own cubit if needed
- Only provide globally if state is truly global (auth, theme, user session)
- Benefits: Better memory management, clearer dependencies, easier testing

**File Organization Summary:**
```
lib/
├── cubits/                    # Shared cubits (used by 2+ screens)
│   └── company_info/
│       ├── company_info_cubit.dart
│       └── company_info_state.dart
├── screens/
│   ├── contact/
│   │   ├── cubit/            # Page-specific cubit (ONLY for contact)
│   │   │   ├── contact_form_cubit.dart
│   │   │   └── contact_form_state.dart
│   │   └── view/
│   │       └── contact_screen.dart
│   └── checkout/
│       ├── cubit/            # Page-specific cubit (ONLY for checkout)
│       │   ├── checkout_cubit.dart
│       │   └── checkout_state.dart
│       └── view/
│           └── checkout_screen.dart
```

**Note:** No barrel files needed for cubits - import cubit and state files directly.

**Decision Tree:**
- Used by ONE screen only? → Put in `screens/[screen]/cubit/`
- Used by MULTIPLE screens? → Put in `cubits/[feature]/`
- Global app state? → Put in `cubits/[feature]/` + provide in Application

### Avoid Nested Listeners
- Don't nest multiple `BlocListener` widgets unnecessarily
- Use `MultiBlocListener` when you need multiple listeners

```dart
MultiBlocListener(
  listeners: [
    BlocListener<AuthCubit, AuthState>(
      listener: (context, state) { /* ... */ },
    ),
    BlocListener<ThemeCubit, ThemeState>(
      listener: (context, state) { /* ... */ },
    ),
  ],
  child: ChildWidget(),
)
```

### Don't Put Business Logic in UI
- Keep business logic in cubit/bloc, not in widgets
- Widgets should only handle presentation and user interaction

## Performance Optimization

### Use Equatable
- Implement `Equatable` for states to prevent unnecessary rebuilds
- Override `props` with all fields that determine state equality

### Use buildWhen and listenWhen
- Filter unnecessary rebuilds and listener calls
- Only rebuild/listen when relevant state changes

### Avoid Expensive Operations in Emit
- Don't perform expensive computations while emitting
- Pre-compute values before emitting

### Consider State Caching
- Cache computed values in state when appropriate
- Avoid recomputing same values on every state emission
