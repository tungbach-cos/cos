# Project Structure Rules

**MANDATORY: Follow this structure for ALL new features and components**

## Overview

This Flutter web application follows a **feature-first, layered architecture** with clear separation of concerns:

1. **Presentation Layer** (`lib/components/`, `lib/screens/`)
2. **Data Layer** (`lib/data/`)
3. **Resources** (`lib/resources/`)

## Directory Structure

```
lib/
├── application.dart              # App configuration & routing
├── main.dart                     # Entry point
│
├── components/                   # Reusable UI components
│   ├── components.dart          # Barrel file exporting all components
│   │
│   ├── common/                  # Shared, generic components
│   │   ├── common.dart          # Barrel file
│   │   ├── section_title.dart
│   │   ├── clickable_text.dart
│   │   ├── icon_text_item.dart
│   │   └── social_icon_button.dart
│   │
│   ├── [component_name]/        # Feature-specific component
│   │   ├── [component_name].dart  # Barrel file
│   │   ├── view/                # UI implementation
│   │   │   ├── view.dart        # Barrel file
│   │   │   └── [component_name].dart
│   │   ├── cubit/               # State management (if needed)
│   │   │   ├── [name]_cubit.dart
│   │   │   ├── [name]_state.dart
│   │   │   └── [name]_state.freezed.dart
│   │   └── models/              # Component-specific models
│   │       ├── model.dart       # Barrel file
│   │       └── [model_name].dart
│   │
│   ├── sections/                # Page sections (hero, CTA, etc.)
│   │   ├── sections.dart        # Barrel file
│   │   ├── hero_section.dart
│   │   ├── cta_section.dart
│   │   └── models/
│   │       └── [section_models].dart
│   │
│   └── navigation/              # Navigation constants
│       └── navigation_constants.dart
│
├── screens/                     # Screen-level features
│   ├── screens.dart             # Barrel file exporting all screens
│   │
│   └── [screen_name]/           # Individual screen
│       ├── [screen_name].dart   # Barrel file
│       ├── view/                # UI implementation
│       │   ├── view.dart        # Barrel file
│       │   └── [screen_name]_screen.dart
│       └── cubit/               # Screen-specific state (if needed)
│           ├── [name]_cubit.dart
│           ├── [name]_state.dart
│           └── [name]_state.freezed.dart
│
├── data/                        # Data layer
│   ├── data.dart                # Barrel file
│   ├── models/                  # Data models
│   │   ├── models.dart          # Barrel file
│   │   ├── [model_name]_model.dart
│   │   └── [model_name]_model.freezed.dart
│   └── repositories/            # Data repositories
│       ├── repositories.dart    # Barrel file
│       └── [repository_name]_repository.dart
│
└── resources/                   # Shared resources
    ├── resources.dart           # Barrel file
    ├── text_styles.dart         # Text style definitions
    └── gen/                     # Generated code (DO NOT EDIT)
        ├── colors.gen.dart      # Generated from colors/colors.xml
        ├── assets.gen.dart      # Generated from assets in pubspec.yaml
        └── fonts.gen.dart       # Generated font definitions
```

## File Organization Rules

### 1. Barrel Files (MANDATORY)

**Every directory MUST have a barrel file** that exports all public APIs.

**Purpose:**
- Clean imports: `import 'package:tungbach/components/components.dart';`
- Encapsulation: Only export what's meant to be public
- Easy refactoring: Change internal structure without breaking imports

**Naming Convention:**
- Use directory name: `components/components.dart`, `screens/screens.dart`
- Or use generic name: `view/view.dart`, `models/model.dart`

**Example barrel file:**
```dart
// lib/components/footer/footer.dart
export 'models/model.dart';
export 'view/view.dart';
```

**Import Pattern:**
```dart
// ✅ CORRECT - Import from barrel file
import 'package:tungbach/components/footer/footer.dart';

// ❌ WRONG - Direct file import
import 'package:tungbach/components/footer/view/footer.dart';
```

### 2. Component Organization

#### When to Create a Component

**Component** (`lib/components/[name]/`):
- ✅ Reusable UI element used across multiple screens
- ✅ Has its own state management (cubit) or complex logic
- ✅ Has component-specific models or configuration
- ✅ Examples: `footer`, `header`, `button`, `responsive_builder`

**Common Component** (`lib/components/common/[name].dart`):
- ✅ Small, generic, highly reusable widget
- ✅ No state management needed
- ✅ Simple, single-file implementation
- ✅ Examples: `section_title.dart`, `clickable_text.dart`, `icon_text_item.dart`

**Section** (`lib/components/sections/[name]_section.dart`):
- ✅ Large page section (hero, CTA, services, etc.)
- ✅ Screen-agnostic, can be reused across pages
- ✅ May have section-specific models in `sections/models/`
- ✅ Examples: `hero_section.dart`, `cta_section.dart`, `contact_form_section.dart`

#### Component Structure

**Full Component (with cubit & models):**
```
components/footer/
├── footer.dart              # Barrel: export 'models/model.dart'; export 'view/view.dart';
├── view/
│   ├── view.dart           # Barrel: export 'footer.dart';
│   └── footer.dart         # Widget implementation
├── cubit/
│   ├── company_info_cubit.dart
│   ├── company_info_state.dart
│   └── company_info_state.freezed.dart
└── models/
    ├── model.dart          # Barrel: export all models
    ├── footer_link_model.dart
    └── social_link_model.dart
```

**Simple Common Component:**
```
components/common/
├── common.dart             # Barrel: export all common widgets
├── section_title.dart      # Single-file widget
├── clickable_text.dart
└── icon_text_item.dart
```

### 3. Screen Organization

#### Screen Structure

**Every screen follows this pattern:**
```
screens/[screen_name]/
├── [screen_name].dart       # Barrel: export 'view/view.dart';
├── view/
│   ├── view.dart           # Barrel: export '[screen_name]_screen.dart';
│   └── [screen_name]_screen.dart  # Screen widget
└── cubit/                  # Optional: only if screen has state
    ├── [name]_cubit.dart
    ├── [name]_state.dart
    └── [name]_state.freezed.dart
```

**Screen Widget Pattern:**
```dart
// lib/screens/home/view/home_screen.dart
import 'package:flutter/material.dart';
import 'package:tungbach/components/components.dart';

/// Home screen displaying hero section and main content.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            ServicesSection(),
            CtaSection(),
          ],
        ),
      ),
    );
  }
}
```

**Screens are:**
- ✅ Composition of sections and components
- ✅ Minimal logic (use cubits for state)
- ✅ Named with `Screen` suffix: `HomeScreen`, `ContactScreen`
- ❌ NO direct API calls
- ❌ NO business logic
- ❌ NO complex widget trees (extract to components)

### 4. Data Layer Organization

#### Structure

```
data/
├── data.dart               # Barrel: export 'models/models.dart'; export 'repositories/repositories.dart';
├── models/
│   ├── models.dart         # Barrel: export all models
│   ├── company_info_model.dart
│   ├── privacy_policy_model.dart
│   └── [model]_model.freezed.dart
└── repositories/
    ├── repositories.dart   # Barrel: export all repositories
    ├── company_info_repository.dart
    └── privacy_policy_repository.dart
```

#### Data Models (MANDATORY)

**All data models MUST:**
- ✅ Use `@freezed` annotation for immutability
- ✅ Be suffixed with `Model`: `CompanyInfoModel`, `PrivacyPolicyModel`
- ✅ Generate `.freezed.dart` file via build_runner
- ✅ Be located in `lib/data/models/`

**Example:**
```dart
// lib/data/models/company_info_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_info_model.freezed.dart';

@freezed
class CompanyInfoModel with _$CompanyInfoModel {
  const factory CompanyInfoModel({
    required String companyName,
    required String email,
    required List<String> phoneNumbers,
    required String address,
  }) = _CompanyInfoModel;
}
```

**Run after creating/modifying models:**
```bash
fvm dart run build_runner build -d
```

#### Repositories

**Repositories:**
- ✅ Handle data fetching, caching, persistence
- ✅ Return `Future<Model>` or `Stream<Model>`
- ✅ Single responsibility per domain entity
- ✅ Suffixed with `Repository`: `CompanyInfoRepository`
- ❌ NO UI imports
- ❌ NO business logic (use cubits/use cases)

**Example:**
```dart
// lib/data/repositories/company_info_repository.dart
class CompanyInfoRepository {
  Future<CompanyInfoModel> getCompanyInfo() async {
    // Fetch from API, local storage, etc.
    return const CompanyInfoModel(
      companyName: 'Company Name',
      email: 'contact@example.com',
      phoneNumbers: ['123-456-7890'],
      address: '123 Main St',
    );
  }
}
```

### 5. Resources Organization

```
resources/
├── resources.dart          # Barrel: export all resources
├── text_styles.dart        # Centralized text styles
└── gen/                    # Generated code (DO NOT EDIT MANUALLY)
    ├── colors.gen.dart     # From colors/colors.xml
    ├── assets.gen.dart     # From pubspec.yaml assets
    └── fonts.gen.dart      # From pubspec.yaml fonts
```

#### Using Generated Resources

**Colors:**
```dart
// ✅ CORRECT - Use generated colors
import 'package:tungbach/resources/resources.dart';

Text('Title', style: TextStyle(color: AppColors.neutral800));
Container(color: AppColors.primary500);
```

**Assets:**
```dart
// ✅ CORRECT - Type-safe asset access
Image.asset(Assets.images.logo.path);
SvgPicture.asset(Assets.icons.leaf1.path);
```

**Text Styles:**
```dart
// ✅ CORRECT - Centralized text styles
import 'package:tungbach/resources/resources.dart';

Text('Title', style: AppTextStyles.heading1);
Text('Body', style: AppTextStyles.bodyMedium);
```

## State Management Patterns

### Cubit Location Decision Tree

**Question: Where should this cubit live?**

1. **Used by ONE component only?**
   → `lib/components/[component_name]/cubit/`
   → Example: `footer/cubit/company_info_cubit.dart`

2. **Used by ONE screen only?**
   → `lib/screens/[screen_name]/cubit/`
   → Example: `privacy_policy/cubit/privacy_policy_cubit.dart`

3. **Used by MULTIPLE screens/components?**
   → `lib/cubits/[feature_name]/` (create if needed)
   → Example: `cubits/auth/auth_cubit.dart`

4. **Global app state (auth, theme, user)?**
   → `lib/cubits/[feature_name]/` + provide in Application
   → Example: `cubits/auth/auth_cubit.dart` in `application.dart`

### Cubit Structure

```
[location]/cubit/
├── [name]_cubit.dart        # Cubit implementation
├── [name]_state.dart        # State definition with @freezed
└── [name]_state.freezed.dart  # Generated file
```

**State Pattern:**
```dart
// [name]_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part '[name]_state.freezed.dart';

@freezed
class PrivacyPolicyState with _$PrivacyPolicyState {
  const factory PrivacyPolicyState.initial() = PrivacyPolicyInitial;
  const factory PrivacyPolicyState.loading() = PrivacyPolicyLoading;
  const factory PrivacyPolicyState.success(PrivacyPolicyModel data) = PrivacyPolicySuccess;
  const factory PrivacyPolicyState.failure(String error) = PrivacyPolicyFailure;
}
```

## Naming Conventions

### File Naming

| Type | Pattern | Example |
|------|---------|---------|
| Screen | `[name]_screen.dart` | `home_screen.dart` |
| Component | `[name].dart` | `footer.dart`, `button.dart` |
| Section | `[name]_section.dart` | `hero_section.dart` |
| Model | `[name]_model.dart` | `company_info_model.dart` |
| Repository | `[name]_repository.dart` | `company_info_repository.dart` |
| Cubit | `[name]_cubit.dart` | `privacy_policy_cubit.dart` |
| State | `[name]_state.dart` | `privacy_policy_state.dart` |
| Barrel | `[directory_name].dart` or `view.dart` or `model.dart` | `components.dart`, `view.dart` |

### Class Naming

| Type | Pattern | Example |
|------|---------|---------|
| Screen | `[Name]Screen` | `HomeScreen`, `ContactScreen` |
| Component | `[Name]` | `Footer`, `Header`, `ResponsiveBuilder` |
| Section | `[Name]Section` | `HeroSection`, `CtaSection` |
| Model | `[Name]Model` | `CompanyInfoModel` |
| Repository | `[Name]Repository` | `CompanyInfoRepository` |
| Cubit | `[Name]Cubit` | `PrivacyPolicyCubit` |
| State | `[Name]State` | `PrivacyPolicyState` |

### Directory Naming

- ✅ Use `lowercase_with_underscores`
- ✅ Be descriptive and specific
- ✅ Examples: `privacy_policy`, `company_info`, `not_found`

## Import Patterns

### Package Imports (MANDATORY)

**Always use package imports for lib/ files:**

```dart
// ✅ CORRECT
import 'package:tungbach/components/components.dart';
import 'package:tungbach/screens/screens.dart';
import 'package:tungbach/data/data.dart';

// ❌ WRONG - relative imports
import '../components/footer/footer.dart';
import '../../data/models/company_info_model.dart';
```

### Import Ordering

**Imports MUST be ordered:**
1. Dart imports (`dart:async`, `dart:io`)
2. Flutter imports (`package:flutter/material.dart`)
3. External package imports (`package:gap/gap.dart`)
4. Internal package imports (`package:tungbach/...`)

**Auto-format:** `fvm dart format .` handles this automatically.

## Adding New Features

### Adding a New Screen

```bash
# 1. Create directory structure
mkdir -p lib/screens/new_screen/view

# 2. Create barrel files
touch lib/screens/new_screen/new_screen.dart
touch lib/screens/new_screen/view/view.dart

# 3. Create screen widget
touch lib/screens/new_screen/view/new_screen_screen.dart

# 4. If state needed:
mkdir -p lib/screens/new_screen/cubit
touch lib/screens/new_screen/cubit/new_screen_cubit.dart
touch lib/screens/new_screen/cubit/new_screen_state.dart

# 5. Export in main barrel
# Add to lib/screens/screens.dart: export 'new_screen/new_screen.dart';

# 6. Run build_runner if using Freezed
fvm dart run build_runner build -d
```

### Adding a New Component

```bash
# For full component:
mkdir -p lib/components/new_component/{view,models}
touch lib/components/new_component/new_component.dart
touch lib/components/new_component/view/view.dart
touch lib/components/new_component/view/new_component.dart
touch lib/components/new_component/models/model.dart

# For simple common component:
touch lib/components/common/new_component.dart
# Add export to lib/components/common/common.dart

# Export in main barrel
# Add to lib/components/components.dart
```

### Adding a New Data Model

```bash
# 1. Create model file
touch lib/data/models/new_model_model.dart

# 2. Add @freezed annotation
# 3. Export in lib/data/models/models.dart
# 4. Run build_runner
fvm dart run build_runner build -d
```

## Code Quality Checklist

Before committing, verify:

- [ ] All new directories have barrel files
- [ ] All imports use package imports (not relative)
- [ ] All models use `@freezed` and are generated
- [ ] All widgets are documented with `///`
- [ ] No hardcoded colors (use `AppColors`)
- [ ] No hardcoded text styles (use `AppTextStyles` or `GoogleFonts`)
- [ ] Components are properly scoped (common vs feature-specific)
- [ ] Cubits are in the right location
- [ ] Run `fvm dart format .`
- [ ] Run `fvm dart analyze` → zero errors/warnings
- [ ] Run `fvm dart fix --apply` if needed
- [ ] Run `fvm dart run build_runner build -d` if models changed

## Anti-Patterns to Avoid

### ❌ Forbidden Patterns

1. **Deep nesting:**
   ```dart
   // ❌ BAD - too deep
   lib/components/footer/view/widgets/sections/company/company_section.dart
   
   // ✅ GOOD - flatten or extract
   lib/components/footer/view/footer.dart  # Compose sections here
   lib/components/sections/company_section.dart  # Or extract to sections
   ```

2. **Direct file imports:**
   ```dart
   // ❌ BAD
   import '../../../components/footer/view/footer.dart';
   
   // ✅ GOOD
   import 'package:tungbach/components/components.dart';
   ```

3. **Missing barrel files:**
   ```dart
   // ❌ BAD - no barrel file
   components/new_feature/
   └── view/
       └── new_feature.dart
   
   // ✅ GOOD - with barrel
   components/new_feature/
   ├── new_feature.dart  # Barrel file
   └── view/
       ├── view.dart     # Barrel file
       └── new_feature.dart
   ```

4. **Mixed responsibilities:**
   ```dart
   // ❌ BAD - data model in components
   lib/components/footer/models/company_info_model.dart
   
   // ✅ GOOD - data model in data layer
   lib/data/models/company_info_model.dart
   lib/components/footer/models/footer_link_model.dart  # UI-specific model OK
   ```

5. **Global cubits for everything:**
   ```dart
   // ❌ BAD - screen cubit provided globally
   MultiBlocProvider(
     providers: [
       BlocProvider(create: (_) => PrivacyPolicyCubit(...)),
     ],
     child: MaterialApp(...),
   )
   
   // ✅ GOOD - provide at screen level
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

## Summary

**Golden Rules:**
1. ✅ **Feature-first organization** - Group by feature/domain, not by type
2. ✅ **Barrel files everywhere** - Every directory exports through a barrel
3. ✅ **Package imports always** - Never use relative imports for lib/ files
4. ✅ **Clear layer separation** - Presentation → Data, never the reverse
5. ✅ **Consistent naming** - Follow conventions for files and classes
6. ✅ **Proper scoping** - Cubits and components at appropriate levels
7. ✅ **Documentation** - Every public API has `///` doc comments
8. ✅ **Code generation** - Use Freezed for models and states
9. ✅ **Type safety** - Use generated colors, assets, fonts
10. ✅ **Quality checks** - Format, analyze, fix before commit

