---
name: dart-linter
description: Dart linter rules and code quality standards
---


# Dart Linter Rules

**MANDATORY: These linter rules MUST be followed for all Dart/Flutter code**

## 🔴 CRITICAL: AI Assistant Must Run These Commands

**BEFORE making ANY code changes or when user requests code quality check:**

1. **ALWAYS run format first:**
   ```bash
   fvm dart format .
   ```

2. **ALWAYS run analyze after:**
   ```bash
   fvm dart analyze
   ```

3. **If errors/warnings exist, MUST fix them with:**
   ```bash
   fvm dart fix --apply
   ```

**Zero tolerance policy:**
- ❌ NO errors allowed
- ❌ NO warnings allowed  
- ✅ Info messages only (line length) are acceptable

**Run these commands when:**
- User explicitly asks to check/analyze code
- Before committing changes
- After making code modifications
- When user says "check linter" or similar requests
- When user is frustrated with code quality

## Project Linting Setup {#project-linting-setup}

### Analysis Options
- All linter rules are configured in `analysis_options.yaml`
- Use `very_good_analysis` package as the base ruleset
- Extend with custom rules specific to this project

### Essential Commands
```bash
# Format code (ALWAYS RUN FIRST)
fvm dart format .

# Analyze entire project (ALWAYS RUN SECOND)
fvm dart analyze

# Auto-fix linter issues (RUN IF ERRORS EXIST)
fvm dart fix --apply

# Analyze specific file/directory
fvm dart analyze lib/components
```

## Critical Linter Rules (MUST FOLLOW)

### Code Style & Formatting

#### **ALWAYS Required**
- `always_declare_return_types` - Explicitly declare return types for all methods
- `annotate_overrides` - Use `@override` annotation when overriding methods
- `prefer_const_constructors` - Use `const` constructors when possible
- `prefer_const_declarations` - Use `const` for immutable declarations
- `prefer_final_fields` - Use `final` for fields that won't change
- `prefer_final_locals` - Use `final` for local variables that won't be reassigned

#### **ALWAYS Avoid**
- `avoid_print` - Never use `print()` in production code (use logging)
- `avoid_unnecessary_containers` - Remove unnecessary Container widgets
- `avoid_web_libraries_in_flutter` - Don't import `dart:html` in Flutter code
- `avoid_dynamic_calls` - Avoid calling methods on dynamic types
- `avoid_types_as_parameter_names` - Don't use type names as parameter names

### Null Safety (CRITICAL)

#### **Required Rules**
- `always_require_non_null_named_parameters` - Require non-null for named parameters
- `avoid_init_to_null` - Don't explicitly initialize to null
- `avoid_null_checks_in_equality_operators` - Don't check for null in `==`
- `prefer_null_aware_operators` - Use `?.`, `??`, `??=` operators
- `unnecessary_null_checks` - Remove unnecessary null checks
- `unnecessary_nullable_for_final_variable_declarations` - Use non-nullable for finals

#### **Best Practices**
- Use `late` only when absolutely necessary
- Prefer non-nullable types by default
- Use null-aware operators instead of explicit null checks
- Avoid `!` operator unless you're certain the value is non-null

### Widget Best Practices (Flutter-Specific)

#### **Required Rules**
- `use_key_in_widget_constructors` - Always include `key` parameter
- `sized_box_for_whitespace` - Use `SizedBox` instead of empty `Container`
- `sort_child_properties_last` - Put `child` property last in widget creation
- `prefer_const_constructors_in_immutables` - Use `const` in immutable widgets
- `use_build_context_synchronously` - Don't use `BuildContext` after async gaps
- `use_colored_box` - Use `ColoredBox` instead of `Container(color: ...)`
- `use_decorated_box` - Use `DecoratedBox` instead of `Container(decoration: ...)`

#### **Widget Optimization**
```dart
// ❌ Bad
Container(color: Colors.red, child: Text('Hello'));

// ✅ Good
ColoredBox(color: Colors.red, child: const Text('Hello'));

// ❌ Bad
Container(width: 100, height: 100);

// ✅ Good
const SizedBox(width: 100, height: 100);
```

### Naming Conventions (MANDATORY)

#### **Required Rules**
- `camel_case_types` - Use `UpperCamelCase` for classes, enums, typedefs
- `camel_case_extensions` - Use `UpperCamelCase` for extensions
- `file_names` - Use `lowercase_with_underscores` for file names
- `library_names` - Use `lowercase_with_underscores` for library names
- `library_prefixes` - Use `lowercase_with_underscores` for import prefixes
- `constant_identifier_names` - Use `lowerCamelCase` for constant names (not SCREAMING_CAPS)

#### **Examples**
```dart
// ✅ Good naming
class UserProfile { }
extension StringExtension on String { }
final kAnimationDuration = Duration(milliseconds: 300);

// ❌ Bad naming
class user_profile { }
extension string_extension on String { }
final ANIMATION_DURATION = Duration(milliseconds: 300);
```

### Documentation (MANDATORY)

#### **Required Rules**
- `slash_for_doc_comments` - Use `///` for documentation comments
- `comment_references` - Only reference in-scope identifiers in doc comments
- `document_ignores` - Document why linter rules are ignored
- `flutter_style_todos` - Use format: `// TODO(username): message, https://URL`

#### **Best Practices**
```dart
/// Reusable section title widget with consistent styling.
///
/// Used throughout the app for section headers.
/// Customize appearance via [fontSize], [color], and [fontWeight].
///
/// Example:
/// ```dart
/// SectionTitle(
///   text: 'Contact Information',
///   fontSize: 20,
/// )
/// ```
class SectionTitle extends StatelessWidget {
  // ...
}

// TODO(tungbach): Implement user authentication, https://github.com/user/repo/issues/123
```

### Async Programming (CRITICAL)

#### **Required Rules**
- `await_only_futures` - Only await Future types
- `unawaited_futures` - Mark futures as `unawaited` if not awaited
- `discarded_futures` - Don't discard futures in async blocks
- `avoid_void_async` - Avoid `async` functions that return `void`
- `prefer_async_await` - Use async/await instead of raw Future callbacks

#### **Best Practices**
```dart
// ✅ Good
Future<void> loadData() async {
  final data = await repository.fetchData();
  setState(() => _data = data);
}

// ❌ Bad - discarded future
void loadData() {
  repository.fetchData(); // Not awaited!
}

// ✅ Good - explicitly unawaited
void loadData() {
  unawaited(repository.fetchData());
}
```

### Code Quality (MANDATORY)

#### **Required Rules**
- `avoid_empty_else` - Avoid empty else blocks
- `avoid_redundant_argument_values` - Don't pass default values explicitly
- `avoid_returning_null_for_void` - Don't return null for void functions
- `avoid_unused_constructor_parameters` - Remove unused constructor parameters
- `empty_catches` - Avoid empty catch blocks
- `empty_constructor_bodies` - Use `;` instead of `{}` for empty constructors
- `unnecessary_overrides` - Don't override just to call super
- `unnecessary_this` - Don't use `this` unless needed for shadowing
- `prefer_is_empty` - Use `isEmpty` instead of `length == 0`
- `prefer_is_not_empty` - Use `isNotEmpty` instead of `length > 0`

#### **Examples**
```dart
// ✅ Good
class User {
  const User({required this.name});
  final String name;
}

// ❌ Bad - unnecessary this
class User {
  const User({required this.name});
  final String name;
  
  String getName() => this.name; // Unnecessary this
}

// ✅ Good
if (list.isEmpty) { /* ... */ }

// ❌ Bad
if (list.length == 0) { /* ... */ }
```

### Imports & Dependencies (CRITICAL)

#### **Required Rules**
- `avoid_relative_lib_imports` - Use package imports for lib/ files
- `depend_on_referenced_packages` - Add all referenced packages to pubspec.yaml
- `implementation_imports` - Don't import internal implementation files
- `directives_ordering` - Sort imports (dart, flutter, package, relative)
- `prefer_relative_imports` - Use relative imports for same package files

#### **Import Order**
```dart
// 1. Dart imports
import 'dart:async';
import 'dart:io';

// 2. Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 3. Package imports
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

// 4. Relative imports (same package)
import '../models/user.dart';
import 'widgets/header.dart';
```

### Performance Optimization

#### **Required Rules**
- `prefer_const_constructors` - Use const for immutable widgets
- `prefer_const_literals_to_create_immutables` - Use const for collections
- `unnecessary_lambdas` - Use tear-offs instead of lambdas
- `avoid_function_literals_in_foreach_calls` - Use for-in loops instead

#### **Examples**
```dart
// ✅ Good - const constructor
const Text('Hello');

// ❌ Bad
Text('Hello');

// ✅ Good - tear-off
items.map(processItem);

// ❌ Bad - unnecessary lambda
items.map((item) => processItem(item));

// ✅ Good - for-in loop
for (final item in items) {
  processItem(item);
}

// ❌ Bad - forEach with lambda
items.forEach((item) => processItem(item));
```

### Error Handling

#### **Required Rules**
- `avoid_catching_errors` - Catch specific exceptions, not Error
- `use_rethrow_when_possible` - Use `rethrow` to rethrow exceptions
- `throw_in_finally` - Avoid throwing in finally blocks
- `control_flow_in_finally` - Avoid control flow in finally blocks

#### **Best Practices**
```dart
// ✅ Good
try {
  riskyOperation();
} on SpecificException catch (e) {
  logger.error('Operation failed', e);
  rethrow;
}

// ❌ Bad
try {
  riskyOperation();
} catch (e) {
  print(e); // Too broad, using print
  throw e; // Should use rethrow
}
```

## Recommended Additional Rules

### Code Consistency
- `cascade_invocations` - Chain method calls with cascades
- `join_return_with_assignment` - Combine assignment and return
- `sort_constructors_first` - Place constructors first in class
- `sort_unnamed_constructors_first` - Place unnamed constructor first

### Type Safety
- `type_annotate_public_apis` - Explicitly type public APIs
- `avoid_annotating_with_dynamic` - Avoid using dynamic type
- `always_specify_types` - Specify types explicitly (optional, can be verbose)

### String Operations
- `prefer_single_quotes` - Use single quotes for strings
- `use_raw_strings` - Use raw strings to avoid escapes
- `prefer_interpolation_to_compose_strings` - Use string interpolation
- `unnecessary_string_interpolations` - Remove unnecessary interpolations

## Rules to Disable (Project-Specific)

### Disabled for Practicality
```yaml
# In analysis_options.yaml
linter:
  rules:
    # Too verbose for this project
    - always_specify_types: false
    
    # Allow private members with leading underscores
    - no_leading_underscores_for_local_identifiers: false
    
    # Allow lines longer than 80 chars for readability
    - lines_longer_than_80_chars: false
    
    # Allow TODO without assignee in development
    - flutter_style_todos: false
```

## Ignoring Specific Rules

### When to Ignore Rules
- Only ignore rules when absolutely necessary
- Always document why a rule is ignored
- Use `// ignore:` for single line ignores
- Use `// ignore_for_file:` for entire file ignores

### Examples
```dart
// ignore: avoid_print
print('Debug info'); // Temporary debug statement

// ignore: prefer_const_constructors
Widget build(BuildContext context) {
  // Can't use const here due to runtime dependencies
  return Container(color: Theme.of(context).primaryColor);
}

// At top of file
// ignore_for_file: avoid_print
// Reason: This is a debug utility file
```

## Auto-Fixing Linter Issues

### Available Quick Fixes
Most linter rules have quick fixes available:
- `fvm dart fix --apply` - Auto-fix all fixable issues
- `fvm dart fix --dry-run` - Preview fixes without applying
- `fvm dart format .` - Format all Dart files

### IDE Integration
- VS Code: Shows linter warnings/errors inline
- Enable "Format on Save" for automatic formatting
- Use "Quick Fix" (Cmd/Ctrl + .) to fix individual issues

## Continuous Integration

### Pre-commit Checks
```bash
#!/bin/bash
# Run before committing
fvm dart format .
fvm dart analyze
fvm dart fix --apply
```

### CI Pipeline Checks
```yaml
# GitHub Actions example
- name: Analyze
  run: fvm dart analyze
  
- name: Check formatting
  run: fvm dart format --set-exit-if-changed .
```

## Summary Checklist {#summary-checklist}

Before committing code, ensure:
- ✅ All linter errors are fixed (`fvm dart analyze`)
- ✅ Code is properly formatted (`fvm dart format .`)
- ✅ All widgets use `const` where possible
- ✅ No `print()` statements in production code
- ✅ Proper documentation comments on public APIs
- ✅ Null safety is properly handled
- ✅ Imports are properly ordered
- ✅ All `@override` annotations are present
- ✅ No unused imports or variables
- ✅ Async functions properly use `await`

## Reference Links

- [Dart Linter Rules](https://dart.dev/tools/linter-rules)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Very Good Analysis](https://pub.dev/packages/very_good_analysis)
- [Dart Analysis Options](https://dart.dev/tools/analysis)
