---
name: clean-architecture
description: Clean Architecture principles and patterns for Flutter applications
---


# Clean Architecture for Flutter

## Overview

This project follows **Clean Architecture** principles with three main layers:
1. **Presentation Layer** (`lib/screens/`, `lib/components/`)
2. **Domain Layer** (`lib/domain/`) - Optional for complex business logic
3. **Data Layer** (`lib/data/`)

## Dependency Rule (CRITICAL)

**Dependencies flow inward only:**
```
Presentation → Domain → Data
     ↓           ↓        ↓
   Widgets    Use Cases  Models
   Cubits     Entities   Repositories
   Screens              Data Sources
```

**Rules:**
- ✅ Presentation can depend on Domain and Data
- ✅ Domain can depend on Data
- ❌ Data CANNOT depend on Presentation
- ❌ Data CANNOT depend on Domain
- ❌ Domain CANNOT depend on Presentation

## Project Structure

### Complete Project Structure {#complete-project-structure}

```
lib/
├── application.dart              # Main app configuration
├── injection.dart               # Dependency injection setup
├── injection.config.dart        # Generated DI configuration
├── main.dart                    # App entry point
├── components/                  # Reusable UI components
│   ├── button/
│   │   ├── button.dart          # Main barrel file
│   │   ├── model/               # Button-specific models
│   │   │   ├── button_colors.dart
│   │   │   ├── button_sizes.dart
│   │   │   ├── button_types.dart
│   │   │   └── model.dart       # Barrel file
│   │   └── view/                # Button UI components
│   │       ├── button.dart
│   │       └── view.dart
│   ├── common/                  # Shared small components
│   │   ├── clickable_text.dart
│   │   ├── common.dart          # Barrel file
│   │   ├── icon_text_item.dart
│   │   ├── section_title.dart
│   │   └── social_icon_button.dart
│   ├── components.dart          # Main components barrel file
│   ├── footer/
│   │   ├── cubit/               # Footer-specific cubit
│   │   │   ├── company_info_cubit.dart
│   │   │   ├── company_info_state.dart
│   │   │   └── company_info_state.freezed.dart
│   │   ├── footer.dart          # Main barrel file
│   │   ├── models/              # Footer-specific models
│   │   │   ├── footer_contact_model.dart
│   │   │   ├── footer_link_model.dart
│   │   │   └── footer_models.dart
│   │   └── view/                # Footer UI components
│   │       ├── footer.dart
│   │       └── view.dart
│   ├── header/
│   │   └── view/                 # Header UI components
│   │       ├── header.dart
│   │       └── view.dart
│   ├── nav_link/
│   │   ├── nav_link.dart        # Main barrel file
│   │   └── view/                # Navigation link components
│   │       ├── nav_link.dart
│   │       └── view.dart
│   ├── navigation/
│   │   └── navigation_constants.dart
│   ├── responsive_builder/
│   │   ├── model/               # Responsive models
│   │   │   ├── screen_sizes.dart
│   │   │   └── screen_sizes_enum.dart
│   │   ├── responsive_builder.dart
│   │   └── view/                # Responsive UI components
│   │       ├── responsive_builder.dart
│   │       └── view.dart
│   └── sections/                # Page sections
│       ├── cta_section.dart
│       ├── products_section.dart
│       └── sections.dart
├── data/                        # Data layer
│   ├── data.dart               # Main data barrel file
│   ├── models/                 # Data models (use Freezed)
│   │   ├── company_info_model.dart
│   │   ├── models.dart         # Models barrel file
│   │   ├── privacy_policy_model.dart
│   │   ├── privacy_policy_model.freezed.dart
│   │   ├── product_model.dart
│   │   ├── terms_of_service_model.dart
│   │   └── terms_of_service_model.freezed.dart
│   └── repositories/           # Repository implementations
│       ├── company_info_repository/
│       │   ├── company_info.dart
│       │   ├── company_info_repository.dart
│       │   └── company_info_repository_impl.dart
│       ├── privacy_policy_repository/
│       │   ├── privacy_policy.dart
│       │   ├── privacy_policy_repository.dart
│       │   └── privacy_policy_repository_impl.dart
│       ├── product_repository/
│       │   ├── product_repository.dart
│       │   └── product_repository_impl.dart
│       ├── terms_of_service_repository/
│       │   ├── terms_of_service.dart
│       │   ├── terms_of_service_repository.dart
│       │   └── terms_of_service_repository_impl.dart
│       └── repositories.dart   # Main repositories barrel file
├── resources/                   # App resources
│   ├── gen/                    # Generated resources
│   │   ├── assets.gen.dart
│   │   ├── colors.gen.dart
│   │   └── fonts.gen.dart
│   ├── resources.dart          # Main resources barrel file
│   └── text_styles.dart        # Typography definitions
└── screens/                    # Screen-level features
    ├── about/
    │   ├── about.dart          # Main barrel file
    │   └── view/               # About screen components
    │       ├── about_screen.dart
    │       ├── hero_section.dart
    │       ├── mission_section.dart
    │       ├── services_section.dart
    │       ├── team_section.dart
    │       └── values_section.dart
    ├── contact/
    │   ├── contact.dart        # Main barrel file
    │   └── view/               # Contact screen components
    │       ├── contact_screen.dart
    │       ├── contact_form.dart
    │       ├── contact_info.dart
    │       └── map_section.dart
    ├── home/
    │   ├── home.dart           # Main barrel file
    │   └── view/               # Home screen components
    │       ├── home_screen.dart
    │       ├── hero_section.dart
    │       ├── products_section.dart
    │       ├── services_section.dart
    │       └── testimonials_section.dart
    ├── not_found/
    │   ├── not_found.dart      # Main barrel file
    │   └── view/               # 404 screen components
    │       ├── not_found_screen.dart
    │       └── not_found_content.dart
    ├── privacy_policy/
    │   ├── cubit/              # Screen-specific cubit
    │   │   ├── privacy_policy_cubit.dart
    │   │   ├── privacy_policy_state.dart
    │   │   └── privacy_policy_state.freezed.dart
    │   ├── privacy_policy.dart # Main barrel file
    │   └── view/                # Privacy policy screen components
    │       ├── privacy_policy_screen.dart
    │       └── privacy_policy_content.dart
    ├── product_detail/
    │   ├── cubit/              # Screen-specific cubit
    │   │   ├── product_detail_cubit.dart
    │   │   ├── product_detail_state.dart
    │   │   └── product_detail_state.freezed.dart
    │   ├── product_detail.dart # Main barrel file
    │   └── view/                # Product detail screen components
    │       ├── product_detail_screen.dart
    │       └── product_detail_content.dart
    ├── screens.dart            # Main screens barrel file
    ├── services/
    │   ├── services.dart       # Main barrel file
    │   └── view/                # Services screen components
    │       ├── services_screen.dart
    │       ├── service_card.dart
    │       ├── service_list.dart
    │       ├── service_section.dart
    │       └── service_detail.dart
    ├── shop/
    │   ├── cubit/              # Screen-specific cubit
    │   │   ├── shop_cubit.dart
    │   │   ├── shop_state.dart
    │   │   └── shop_state.freezed.dart
    │   ├── shop.dart           # Main barrel file
    │   └── view/                # Shop screen components
    │       ├── shop_screen.dart
    │       └── shop_content.dart
    ├── splash/
    │   ├── splash.dart         # Main barrel file
    │   └── view/                # Splash screen components
    │       ├── splash_screen.dart
    │       └── splash_content.dart
    └── terms_of_service/
        ├── cubit/              # Screen-specific cubit
        │   ├── terms_of_service_cubit.dart
        │   ├── terms_of_service_state.dart
        │   └── terms_of_service_state.freezed.dart
        ├── terms_of_service.dart # Main barrel file
        └── view/                # Terms of service screen components
            ├── terms_of_service_screen.dart
            └── terms_of_service_content.dart
```

### Key Structure Principles

#### 1. **Feature-Based Organization**
- Each major feature has its own folder
- Related files are grouped together
- Clear separation between UI and business logic

#### 2. **Layer Separation**
- **Presentation Layer**: `screens/`, `components/`
- **Data Layer**: `data/`
- **Resources**: `resources/`
- **Application**: Root level files

#### 3. **Component Structure**
```
feature_name/
├── feature_name.dart          # Main barrel file
├── cubit/                     # State management (if needed)
│   ├── feature_cubit.dart
│   ├── feature_state.dart
│   └── feature_state.freezed.dart
├── models/                    # Feature-specific models (if needed)
│   ├── feature_model.dart
│   └── feature_models.dart
└── view/                      # UI components
    ├── feature_screen.dart
    └── feature_content.dart
```

#### 4. **Barrel File Strategy**
- **Main barrel files**: Export all public APIs for a feature
- **Nested barrel files**: Export related components
- **No barrel files for cubits**: Import directly

#### 5. **File Naming Conventions**
- **Screens**: `feature_screen.dart`
- **Components**: `component_name.dart`
- **Cubits**: `feature_cubit.dart`
- **States**: `feature_state.dart`
- **Models**: `feature_model.dart`
- **Barrel files**: `feature_name.dart`

### Directory Structure Patterns

#### **Screen Structure Pattern**
```
screens/feature_name/
├── feature_name.dart          # Main barrel file
├── cubit/                     # State management (if needed)
│   ├── feature_cubit.dart
│   ├── feature_state.dart
│   └── feature_state.freezed.dart
└── view/                      # UI components
    ├── feature_screen.dart    # Main screen widget
    ├── feature_content.dart   # Screen content
    ├── feature_section.dart  # Screen sections
    └── feature_widget.dart   # Screen-specific widgets
```

#### **Component Structure Pattern**
```
components/component_name/
├── component_name.dart        # Main barrel file
├── cubit/                     # State management (if needed)
│   ├── component_cubit.dart
│   ├── component_state.dart
│   └── component_state.freezed.dart
├── models/                    # Component-specific models
│   ├── component_model.dart
│   └── component_models.dart
└── view/                      # UI components
    ├── component.dart         # Main component
    └── view.dart             # Component views
```

#### **Repository Structure Pattern**
```
data/repositories/repository_name/
├── repository_name.dart       # Main barrel file
├── repository_name.dart       # Interface
└── repository_name_impl.dart  # Implementation
```

### Import Patterns

#### **Barrel File Usage**
```dart
// ✅ CORRECT - Use barrel files for clean imports
import 'package:tungbach/screens/screens.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/data/data.dart';

// ❌ AVOID - Direct imports when barrel files exist
import 'package:tungbach/screens/home/view/home_screen.dart';
```

#### **Cubit Import Pattern**
```dart
// ✅ CORRECT - Import cubit and state directly
import 'package:tungbach/screens/shop/cubit/shop_cubit.dart';
import 'package:tungbach/screens/shop/cubit/shop_state.dart';

// ❌ AVOID - No barrel files for cubits
import 'package:tungbach/screens/shop/cubit/shop.dart';
```

#### **Model Import Pattern**
```dart
// ✅ CORRECT - Use data.dart for models from outside data layer
import 'package:tungbach/data/data.dart';

// ✅ CORRECT - Use direct path from inside data layer
import 'package:tungbach/data/models/models.dart';
```

### State Management Patterns

#### **Screen-Specific Cubits**
- **Location**: `screens/[feature]/cubit/`
- **Usage**: One screen only
- **Scope**: Screen-level state management
- **Example**: `screens/shop/cubit/shop_cubit.dart`

#### **Component-Specific Cubits**
- **Location**: `components/[component]/cubit/`
- **Usage**: One component only
- **Scope**: Component-level state management
- **Example**: `components/footer/cubit/company_info_cubit.dart`

#### **Shared Cubits (Rare)**
- **Location**: `cubits/[feature]/`
- **Usage**: Multiple screens/components
- **Scope**: Global state (auth, theme, user session)
- **Example**: `cubits/auth/auth_cubit.dart`

### Resource Organization

#### **Generated Resources**
```
resources/gen/
├── assets.gen.dart           # Generated asset paths
├── colors.gen.dart           # Generated color definitions
└── fonts.gen.dart            # Generated font definitions
```

#### **Custom Resources**
```
resources/
├── resources.dart            # Main resources barrel file
└── text_styles.dart         # Typography definitions
```

### Build Configuration

#### **Dependency Injection**
```
lib/
├── injection.dart           # DI setup
├── injection.config.dart    # Generated DI configuration
└── main.dart               # App entry point
```

#### **Application Configuration**
```
lib/
├── application.dart         # Main app configuration
└── main.dart              # App entry point
```

### Testing Structure

#### **Unit Tests**
```
test/
├── unit/
│   ├── cubits/             # Cubit tests
│   ├── repositories/       # Repository tests
│   └── models/            # Model tests
└── widget_test.dart       # Default widget test
```

#### **Integration Tests**
```
integration_test/
└── app_test.dart          # End-to-end tests
```

### Asset Organization

#### **Assets Structure**
```
assets/
├── images/                 # Image assets
│   ├── logo.png
│   └── landscape_logo.png
├── icons/                  # Icon assets
│   ├── leaf_1.svg
│   ├── leaf_2.svg
│   └── leaf_3.svg
└── fonts/                  # Font assets
    └── social-icon-font.woff2
```

#### **Web Assets**
```
web/
├── index.html             # Main HTML file
├── manifest.json          # Web app manifest
├── favicon.png           # Favicon
└── icons/                # Web app icons
    ├── Icon-192.png
    ├── Icon-512.png
    └── Icon-maskable-192.png
```

### Scripts and Configuration

#### **Build Scripts**
```
scripts/
├── deploy-shop.sh         # Deployment script
└── generate_logo.sh       # Logo generation script
```

#### **Configuration Files**
```
├── analysis_options.yaml  # Dart analysis options
├── build.yaml            # Build configuration
├── devtools_options.yaml # DevTools configuration
├── pubspec.yaml          # Dependencies
└── README.md             # Project documentation
```

## Layer Structure

### 1. Data Layer (`lib/data/`)

**Purpose:** Handle data operations, API calls, local storage

**Structure:**
```
lib/data/
├── models/              # Data models (use Freezed)
│   ├── company_info_model.dart
│   ├── privacy_policy_model.dart
│   └── models.dart      # Barrel file (data layer only)
├── repositories/        # Repository implementations
│   ├── company_info.dart                    # Main barrel file
│   ├── company_info_repository/
│   │   ├── company_info_repository.dart     # Interface (no "_interface")
│   │   ├── company_info_repository_impl.dart # Implementation
│   │   └── company_info.dart                # Barrel file
│   ├── privacy_policy.dart                  # Main barrel file  
│   ├── privacy_policy_repository/
│   │   ├── privacy_policy_repository.dart   # Interface (no "_interface")
│   │   ├── privacy_policy_repository_impl.dart # Implementation
│   │   └── privacy_policy.dart                # Barrel file
│   ├── product_repository/
│   │   ├── product_repository.dart         # Interface (no "_interface")
│   │   ├── product_repository_impl.dart    # Implementation
│   │   └── product_repository.dart         # Barrel file
│   └── repositories.dart # Barrel file (data layer only)
└── data.dart           # Main barrel file (data layer only)
```

**Rules:**
- ✅ Models are **immutable** (use `@freezed`)
- ✅ **Repository interfaces MUST use `abstract interface`** for proper abstraction
- ✅ **Repository implementations MUST be `final`** to prevent inheritance
- ✅ Repositories are **instance-based** (not const, no static methods except for static data)
- ✅ **Annotate with `@Injectable()`** for dependency injection (new instance per request)
- ✅ **All repository methods return `Future<T>` or `Stream<T>`** for consistency
- ✅ Simulate network delays (`await Future.delayed`) in mock repositories
- ✅ Handle data transformation (API ↔ Model)
- ✅ Single Responsibility: One repository per domain entity
- ✅ Document where real data would come from (API endpoints, database queries, etc.)
- ❌ NO UI logic
- ❌ NO business rules
- ❌ NO widget imports
- ❌ NO const constructors (repositories manage state/connections)
- ❌ NO `@lazySingleton` (use `@Injectable()` for new instance per request)

**Example Model:**
```dart
@freezed
class CompanyInfoModel with _$CompanyInfoModel {
  const factory CompanyInfoModel({
    required String companyName,
    required String email,
    required List<String> phoneNumbers,
  }) = _CompanyInfoModel;
}
```

**Example Repository Interface:**
```dart
/// Repository interface for company information data operations.
abstract interface class CompanyInfoRepository {
  /// Gets company information
  ///
  /// In a real app, this might fetch from:
  /// - Remote API: GET /api/company/info
  /// - Local database: SELECT * FROM company_info
  /// - Firebase Remote Config: company_info_config
  /// - Environment variables: COMPANY_INFO_*
  Future<CompanyInfoModel> getCompanyInfo();
}
```

**Example Repository Implementation:**
```dart
import 'package:injectable/injectable.dart';

@Injectable(as: CompanyInfoRepository)  // ← Registers interface with implementation
final class CompanyInfoRepositoryImpl implements CompanyInfoRepository {
  /// Creates a company info repository implementation
  CompanyInfoRepositoryImpl();

  @override
  Future<CompanyInfoModel> getCompanyInfo() async {
    // Simulate network delay for realistic behavior
    await Future<void>.delayed(const Duration(milliseconds: 100));
    
    // In production, this would make actual API calls:
    // final response = await httpClient.get('/api/company/info');
    // return CompanyInfoModel.fromJson(response.data);
    
    return const CompanyInfoModel(
      companyName: 'Tung Bach Company',
      email: 'info@tungbach.com',
      phoneNumbers: ['+84 123 456 789', '+84 987 654 321'],
    );
  }
}
```

**Example Cubit Using Repository Interface:**
```dart
import 'package:injectable/injectable.dart';

@injectable  // ← Registers with service locator
class CompanyInfoCubit extends Cubit<CompanyInfoState> {
  CompanyInfoCubit({
    required CompanyInfoRepository companyRepository,  // ← Interface type
  })  : _companyRepository = companyRepository,
        super(const CompanyInfoState.initial());

  final CompanyInfoRepository _companyRepository;  // ← Interface type

  Future<void> loadCompanyInfo() async {
    emit(const CompanyInfoState.loading());
    try {
      final companyInfo = await _companyRepository.getCompanyInfo();
      if (!isClosed) {
        emit(CompanyInfoState.success(companyInfo));
      }
    } catch (e) {
      if (!isClosed) {
        emit(CompanyInfoState.failure(e.toString()));
      }
    }
  }
}
```

### 2. Domain Layer (`lib/domain/`) - Optional

**Purpose:** Business logic, use cases, domain entities

**Structure:**
```
lib/domain/
├── entities/           # Business entities (pure Dart)
│   └── user_entity.dart
├── usecases/          # Use cases (business operations)
│   └── get_user_usecase.dart
└── domain.dart        # Barrel file (optional for domain layer)
```

**When to Use Domain Layer:**
- ✅ Complex business logic spanning multiple repositories
- ✅ Business rules that don't fit in presentation or data
- ✅ Domain-specific validations
- ❌ Skip for simple CRUD apps (use repositories directly)

**Rules:**
- ✅ Pure Dart code (no Flutter dependencies)
- ✅ Use cases represent single business operations
- ✅ Entities are business objects (not data models)
- ❌ NO UI imports
- ❌ NO framework-specific code

**Example Use Case:**
```dart
class GetUserProfileUseCase {
  GetUserProfileUseCase({
    required this.userRepository,
    required this.settingsRepository,
  });

  final UserRepository userRepository;
  final SettingsRepository settingsRepository;

  Future<UserProfile> execute(String userId) async {
    final user = await userRepository.getUser(userId);
    final settings = await settingsRepository.getSettings(userId);
    
    // Business logic here
    return UserProfile.fromUserAndSettings(user, settings);
  }
}
```

### 3. Presentation Layer (`lib/screens/`, `lib/components/`)

**Purpose:** UI, widgets, state management, user interactions

**Structure:**
```
lib/
├── screens/                    # Screen-level features
│   └── privacy_policy/
│       ├── cubit/             # Screen-specific cubit (no barrel file)
│       │   ├── privacy_policy_cubit.dart
│       │   ├── privacy_policy_state.dart
│       │   └── privacy_policy_state.freezed.dart
│       └── view/              # Screen UI
│           └── privacy_policy_screen.dart
├── components/                 # Reusable UI components
│   ├── header/
│   │   └── view/
│   │       └── header.dart
│   ├── footer/
│   │   ├── cubit/            # Component-specific cubit (no barrel file)
│   │   │   ├── company_info_cubit.dart
│   │   │   └── company_info_state.dart
│   │   └── view/
│   │       └── footer.dart
│   ├── button/
│   ├── common/               # Shared small components
│   └── navigation/           # Presentation constants
│       └── navigation_constants.dart
└── resources/                # Themes, colors, assets
    ├── colors/
    ├── text_styles.dart
    └── resources.dart
```

**Note:** No barrel files for cubits - import directly in view files.

**Rules:**
- ✅ Screens/Components provide their own Cubits via `BlocProvider`
- ✅ Cubits fetch data from repositories or use cases
- ✅ States use `@freezed` for immutability
- ✅ Use `BlocBuilder`, `BlocListener`, `BlocConsumer`
- ✅ Keep widgets focused on presentation only
- ❌ NO business logic in widgets
- ❌ NO direct API calls from widgets
- ❌ NO data transformation in widgets

## State Management with Cubit

### Cubit Location Rules

**Screen-Specific Cubit:**
```
lib/screens/privacy_policy/cubit/privacy_policy_cubit.dart
```
- Used by ONE screen only
- Manages screen-specific state
- Provided at screen level

**Component-Specific Cubit:**
```
lib/components/footer/cubit/company_info_cubit.dart
```
- Used by ONE component only
- Component provides its own cubit
- Self-contained state management

**Shared Cubit (RARE):**
```
lib/cubits/auth/auth_cubit.dart
```
- Used by MULTIPLE screens/components
- Truly global state (auth, theme, user session)
- Provided at Application level

### Cubit Pattern & Single Responsibility

**CRITICAL: Each screen cubit should fetch ALL data that screen needs**

❌ **Don't** reuse component cubits in screens  
✅ **Do** fetch all necessary data in the screen's own cubit

**Why?**
- ✅ Single responsibility: One cubit manages all screen data
- ✅ Single source of truth for screen state
- ✅ Simpler: One BlocProvider instead of MultiBlocProvider
- ✅ Better performance: Fetch data in parallel with Future.wait
- ✅ Clearer dependencies: All repos injected in cubit constructor
- ❌ Avoid coupling: Don't reuse component cubits (like CompanyInfoCubit) in screens

**State with Freezed (Multiple Data Sources):**
```dart
@freezed
class PrivacyPolicyState with _$PrivacyPolicyState {
  const factory PrivacyPolicyState.initial() = PrivacyPolicyInitial;
  const factory PrivacyPolicyState.loading() = PrivacyPolicyLoading;
  const factory PrivacyPolicyState.success({
    required PrivacyPolicyModel policy,
    required CompanyInfoModel companyInfo,  // Include all needed data
  }) = PrivacyPolicySuccess;
  const factory PrivacyPolicyState.failure(String error) = PrivacyPolicyFailure;
}
```

**Cubit Implementation (Single Responsibility):**
```dart
import 'package:injectable/injectable.dart';

@injectable  // ← Registers with service locator
class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit({
    required PrivacyPolicyRepository policyRepository,   // ← Named parameter
    required CompanyInfoRepository companyRepository,     // ← Named parameter
  })  : _policyRepository = policyRepository,
        _companyRepository = companyRepository,
        super(const PrivacyPolicyState.initial());

  final PrivacyPolicyRepository _policyRepository;
  final CompanyInfoRepository _companyRepository;

  /// Fetch ALL data this screen needs in one method
  Future<void> loadPrivacyPolicy() async {
    emit(const PrivacyPolicyState.loading());
    try {
      // Fetch all data in parallel for better performance
      final results = await Future.wait([
        _policyRepository.getPrivacyPolicy(),
        _companyRepository.getCompanyInfo(),
      ]);

      if (!isClosed) {
        emit(
          PrivacyPolicyState.success(
            policy: results[0] as PrivacyPolicyModel,
            companyInfo: results[1] as CompanyInfoModel,
          ),
        );
      }
    } on Exception catch (e) {
      if (!isClosed) {
        emit(PrivacyPolicyState.failure(e.toString()));
      }
    }
  }
}
```

**Screen Usage (Single BlocProvider with Injectable):**
```dart
import 'package:tungbach/injection.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Use getIt - Injectable handles dependency injection
      create: (context) => getIt<PrivacyPolicyCubit>()..loadPrivacyPolicy(),
      child: const _PrivacyPolicyContent(),
    );
  }
}

class _PrivacyPolicyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const CircularProgressIndicator(),
          success: (policy, companyInfo) => /* render with all data */,
          failure: (error) => Text('Error: $error'),
        );
      },
    );
  }
}
```

## Dependency Injection with Injectable

**See: [Dependency Injection Rules](dependency_injection.mdc) for complete DI setup, configuration, and patterns**

### Setup (lib/injection.dart)

**Initialize service locator before running app:**
```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
```

**Initialize in main():**
```dart
// lib/main.dart
import 'package:tungbach/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependency injection
  await configureDependencies();
  
  runApp(const Application());
}
```

### Repository Registration

**All repository implementations use `@Injectable(as: InterfaceClass)`:**
```dart
import 'package:injectable/injectable.dart';

@Injectable(as: CompanyInfoRepository)  // ← Registers interface with implementation
final class CompanyInfoRepositoryImpl implements CompanyInfoRepository {
  CompanyInfoRepositoryImpl();
  
  @override
  Future<CompanyInfoModel> getCompanyInfo() async { }
}

@Injectable(as: ProductRepository)
final class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl();
  
  @override
  Future<List<ProductModel>> getAllProducts() async { }
}
```

**Important:**
- ✅ Use `@Injectable(as: InterfaceClass)` for repository implementations
- ✅ Repository interfaces use `abstract interface class`
- ✅ Repository implementations use `final class` and `implements` interface
- ✅ Injectable resolves interface to implementation automatically
- ✅ Ensures no shared state between screens
- ✅ Better testability and isolation
- ❌ NO `@lazySingleton` for repositories (unless caching is needed)

### Cubit Registration

**All cubits use `@injectable` with named parameters:**
```dart
import 'package:injectable/injectable.dart';

@injectable  // ← Registers with service locator
class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit({
    required PrivacyPolicyRepository policyRepository,    // ← MUST be named (interface)
    required CompanyInfoRepository companyRepository,      // ← MUST be named (interface)
  })  : _policyRepository = policyRepository,
        _companyRepository = companyRepository,
        super(const PrivacyPolicyState.initial());

  final PrivacyPolicyRepository _policyRepository;  // ← Interface type
  final CompanyInfoRepository _companyRepository;    // ← Interface type
  
  Future<void> loadPrivacyPolicy() async { }
}
```

### Screen Usage with GetIt

**Use getIt to resolve cubits:**
```dart
import 'package:tungbach/injection.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // getIt automatically injects all dependencies
      create: (context) => getIt<PrivacyPolicyCubit>()..loadPrivacyPolicy(),
      child: const _PrivacyPolicyContent(),
    );
  }
}
```

**Application widget (NO repository providers needed):**
```dart
// lib/application.dart
class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // NO MultiRepositoryProvider - Injectable handles DI
    return MaterialApp.router(
      routerConfig: router,
      // ...
    );
  }
}
```

**Rules:**
- ✅ Use `getIt<CubitType>()` instead of manual instantiation
- ✅ Injectable automatically resolves repository dependencies
- ✅ No need for `MultiRepositoryProvider`
- ✅ No need for `context.read<Repository>()`
- ❌ NO manual dependency wiring in screens

## Data Flow Example

**User Action → Presentation → Data:**
```
1. User taps button
   ↓
2. Widget calls cubit.loadData()
   ↓
3. Cubit calls repository.fetchData()
   ↓
4. Repository fetches from API/DB
   ↓
5. Repository returns Model
   ↓
6. Cubit emits state with Model
   ↓
7. BlocBuilder rebuilds UI
```

## What Goes Where?

### Data Layer (lib/data/)
- ✅ API client configuration
- ✅ Data models (DTOs)
- ✅ Repositories
- ✅ Data sources (API, local DB)
- ✅ Data transformation logic

### Presentation Layer (lib/screens/, lib/components/)
- ✅ Widgets
- ✅ Screens
- ✅ Cubits/Blocs
- ✅ UI states
- ✅ Navigation
- ✅ Themes, colors, text styles
- ✅ Presentation constants (nav links, etc.)

### What is NOT Data Layer?
- ❌ Navigation links → Presentation constants
- ❌ UI-specific models → Presentation models
- ❌ Theme data → Resources
- ❌ Hardcoded UI text → Presentation constants
- ❌ Screen-specific logic → Cubit

## Best Practices

### 1. Single Responsibility
- One repository per domain entity
- One cubit per screen/component
- One model per data structure
- **Each screen cubit fetches ALL data that screen needs**
- Don't reuse component cubits in screens - fetch from repositories directly
- Use `Future.wait` to fetch multiple data sources in parallel

### 2. Immutability
```dart
// ✅ Good - Immutable with Freezed
@freezed
class UserModel with _$UserModel {
  const factory UserModel({required String name}) = _UserModel;
}

// ❌ Bad - Mutable
class UserModel {
  String name;
}
```

### 3. Async Error Handling
```dart
// ✅ Good - Handle errors in cubit
Future<void> loadData() async {
  emit(const State.loading());
  try {
    final data = await repository.getData();
    if (!isClosed) {
      emit(State.success(data));
    }
  } catch (e) {
    if (!isClosed) {
      emit(State.failure(e.toString()));
    }
  }
}
```

### 4. Testing Strategy
- **Unit Tests**: Repositories, Use Cases
- **Widget Tests**: Screens, Components
- **Integration Tests**: Full user flows

### 5. Barrel Files (Data Layer Only)
```dart
// lib/data/data.dart
export 'models/models.dart';
export 'repositories/repositories.dart';

// lib/data/models/models.dart
export 'company_info_model.dart';
export 'privacy_policy_model.dart';
```

**Important:** Barrel files are ONLY for the data layer (models, repositories). 
- ❌ Don't create barrel files for cubits
- ❌ Don't create barrel files for screens
- ✅ Import cubit and state files directly where needed

## Common Anti-Patterns

### ❌ Don't Mix Layers
```dart
// ❌ BAD - Widget calling API directly
class MyWidget extends StatelessWidget {
  Future<void> fetchData() async {
    final response = await http.get('https://api.com');
    // ...
  }
}

// ✅ GOOD - Widget uses cubit, cubit uses repository
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<MyCubit>().loadData();
  }
}
```

### ❌ Don't Put Business Logic in Widgets
```dart
// ❌ BAD - Logic in widget
if (user.isPremium && user.hasActiveSubscription) {
  return PremiumFeature();
}

// ✅ GOOD - Logic in cubit/use case
final canAccessPremium = cubit.checkPremiumAccess();
```

### ❌ Don't Create Global Cubits for Everything
```dart
// ❌ BAD - Screen cubit provided globally
MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => PrivacyPolicyCubit(...)),
  ],
  child: MaterialApp(...),
)

// ✅ GOOD - Screen cubit provided at screen level
class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrivacyPolicyCubit(...),
      child: ...,
    );
  }
}
```

## Quick Decision Tree

**Where should this code go?**

1. **Is it a reusable UI component?** → `lib/components/`
2. **Is it a full screen?** → `lib/screens/`
3. **Does it fetch/save data?** → `lib/data/repositories/`
4. **Is it a data structure?** → `lib/data/models/`
5. **Is it business logic?** → `lib/domain/usecases/` or Cubit
6. **Is it presentation constant?** → `lib/components/navigation/` or similar
7. **Is it theme/style?** → `lib/resources/`

**When to create a Cubit?**

1. **Screen needs data from repository?** → Screen-specific cubit in `screens/[name]/cubit/`
2. **Component needs data from repository?** → Component-specific cubit in `components/[name]/cubit/`
3. **Multiple screens need same data?** → Shared cubit in `cubits/[name]/`
4. **Simple static data for UI?** → No cubit needed, use constants

## File Organization Checklist

### Data Layer
- [ ] All data models use `@freezed`
- [ ] **Repository interfaces use `abstract interface class`**
- [ ] **Repository implementations use `final class` and `implements` interface**
- [ ] **All repository implementations annotated with `@Injectable(as: InterfaceClass)`** (NOT `@lazySingleton`)
- [ ] **All repository methods return `Future<T>` or `Stream<T>`**
- [ ] **Repositories are instance-based (no const constructors)**
- [ ] **Repository methods include documentation about real-world data sources**
- [ ] **Mock repositories simulate network delays for realism**
- [ ] Barrel files for data layer (models, repositories) only

### Presentation Layer
- [ ] All cubit states use `@freezed` or `@Freezed(copyWith: false)`
- [ ] **All cubits annotated with `@injectable`**
- [ ] **All cubit constructors use named parameters** - `{required Type param}`
- [ ] Cubits use `await` when calling async repository methods
- [ ] Screens use `getIt<CubitType>()` to resolve dependencies
- [ ] NO `context.read<Repository>()` in screens
- [ ] Cubits are located in appropriate folders
- [ ] NO barrel files for cubits - import directly

### Dependency Injection
- [ ] **`lib/injection.dart` created with `@InjectableInit()`**
- [ ] **`main.dart` calls `configureDependencies()` before `runApp()`**
- [ ] NO `MultiRepositoryProvider` in Application
- [ ] All dependencies resolved through `getIt`
- [ ] No circular dependencies

### Build and Quality
- [ ] Run `fvm dart run build_runner build -d` after DI changes
- [ ] Run `fvm dart analyze` - zero errors
- [ ] Run `fvm dart format .` before commit
