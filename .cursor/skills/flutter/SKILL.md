---
name: flutter
description: Flutter framework best practices and widget guidelines
---


# Flutter Framework Rules

**⚠️ CRITICAL: These rules MUST be applied to ALL Dart files in the presentation layer**

**ENFORCEMENT:**
- Run `fvm dart analyze` before every commit
- Run `fvm dart fix --apply` to auto-fix violations
- Run `fvm dart format .` to ensure consistent formatting
- **Zero tolerance for linter errors and warnings**
- All code must pass analysis before code review

## Project Setup (MANDATORY)
- **This project uses FVM (Flutter Version Management)**
- **NEVER** run Flutter/Dart commands without the `fvm` prefix
- Commands: `fvm flutter pub get`, `fvm dart analyze`, `fvm dart fix --apply`
- Verify FVM is used: Check `.fvm/` directory exists

**See: [Dart Linter Rules](dart_linter.mdc#project-linting-setup) for complete linting setup and commands**

## Widget Best Practices

### Widget Construction (MANDATORY - ENFORCED BY LINTER)
- ✅ **ALWAYS** use `const` constructors for immutable widgets (`prefer_const_constructors`)
- ✅ **MUST** break down large widgets into smaller, reusable components (max 200 lines per widget)
- ✅ Keep the `build` method simple and focused (max 50 lines)
- ✅ Extract complex widget trees into separate private widgets or methods
- ✅ Use `const` widgets whenever possible to improve performance
- ✅ Every widget must have clear documentation comments (`///`)
- ✅ Private widgets must start with underscore `_WidgetName`
- ✅ Widget files must have newline at end of file (`eol_at_end_of_file`)

**Auto-fixable via:** `fvm dart fix --apply`

### Widget Naming (MANDATORY)
- Widget classes **MUST** be descriptive and follow semantic naming
- Public reusable widgets: `DescriptiveName` (e.g., `SectionTitle`, `IconTextItem`, `ClickableText`)
- Private widgets: `_DescriptiveName` (e.g., `_HeaderSection`, `_CompanySection`)
- Screen widgets: `ScreenNameScreen` (e.g., `HomeScreen`, `ContactScreen`)
- Section widgets: `SectionNameSection` (e.g., `HeroSection`, `ServicesSection`)
- Use clear, semantic names that describe the widget's purpose, not its implementation

### State Management (MANDATORY)
- ✅ Use `StatelessWidget` when the widget doesn't need to maintain state
- ✅ Use `StatefulWidget` only when internal state is required
- ✅ **ALWAYS** dispose of resources in `dispose()` method (controllers, streams, subscriptions)
- ✅ Use `setState()` only when necessary and keep it minimal
- ✅ For state management: Use Cubit (simple) or Bloc (complex event handling)
- ✅ Never put business logic in widgets - use Cubits/Blocs/Services
- ✅ All state classes must be `@immutable` with `final` fields

## Layout & Responsive Design

### Responsive Layouts
- Use `MediaQuery` for screen size information
- Implement responsive breakpoints for different screen sizes
- Test on multiple screen sizes (mobile, tablet, desktop)
- Use `LayoutBuilder` for adaptive layouts based on parent constraints
- Prefer `Flex` widgets (Row, Column) with `Flexible` and `Expanded` for flexible layouts

### Spacing & Padding
- Use `Gap` widget (from gap package) for consistent spacing
- Use `EdgeInsets` for padding with descriptive values
- Maintain consistent spacing throughout the app
- Use spacing constants or theme values for consistency

## Performance Optimization (ENFORCED BY LINTER)

### Build Method Optimization
- ❌ **NEVER** create new objects in the `build` method
- ✅ Extract const widgets from the widget tree (`prefer_const_constructors`)
- ✅ Use `const` constructors wherever possible
- ✅ Cache expensive computations outside the build method (use getters or final fields)
- ✅ Avoid deep widget trees (split into smaller widgets - max 5 levels)
- ✅ Use `ColoredBox` instead of `Container(color: ...)` (`use_colored_box`)
- ✅ Use `DecoratedBox` instead of `Container(decoration: ...)` (`use_decorated_box`)
- ✅ Use `SizedBox` instead of empty `Container` (`sized_box_for_whitespace`)

**Linter rules:** `prefer_const_constructors`, `use_colored_box`, `use_decorated_box`, `sized_box_for_whitespace`

### Images & Assets
- Use appropriate image formats (SVG for icons, WebP/PNG for images)
- Implement image caching strategies
- Use `CachedNetworkImage` for network images
- Optimize image sizes and resolutions
- Lazy load images when possible

### Lists & Scrolling
- Use `ListView.builder` or `ListView.separated` for long lists
- Implement `const` constructors for list items
- Use `RepaintBoundary` for complex list items
- Consider `ListView.separated` for lists with dividers
- Use `CustomScrollView` with `Slivers` for complex scrolling behavior

## Styling & Theming (MANDATORY - STRICTLY ENFORCED)

### Theme Usage
- ✅ **MUST** define all colors in `AppColors` class (generated via flutter_gen)
- ❌ **NEVER** hardcode color values in widgets (e.g., `Color(0xFF...)`)
- ✅ Use `Theme.of(context)` to access theme data when needed
- ✅ **ALWAYS** use reusable text styles from `AppTextStyles`
- ✅ Use Google Fonts with consistent font families (`GoogleFonts.lora()`, `GoogleFonts.inter()`)
- ✅ Use `withValues(alpha: X)` instead of deprecated `withOpacity(X)`
- ✅ Maintain consistent spacing using `Gap` widget from `gap` package
- ✅ All spacing values should be multiples of 4 or 8 for consistency

**Example:**
```dart
// ✅ CORRECT
Text(
  'Title',
  style: GoogleFonts.lora(
    fontSize: 24,
    color: AppColors.neutral800,
  ),
)

// ❌ WRONG
Text(
  'Title',
  style: TextStyle(
    fontSize: 24,
    color: Color(0xFF142A25), // Hardcoded color
  ),
)
```

### Colors & Typography
- Use semantic color names (e.g., `primary`, `secondary`, `error`)
- Define text styles with proper font sizes, weights, and heights
- Use Google Fonts or custom fonts consistently
- Ensure sufficient color contrast for accessibility
- Use Material 3 design principles

## Navigation

### Routing
- Use declarative routing (GoRouter, auto_route, or similar)
- Define route names as constants
- Handle deep linking properly
- Implement proper error/404 pages
- Use typed navigation when possible

### Route Management
- Keep route definitions centralized
- Use path parameters for dynamic routes
- Implement navigation guards if needed
- Handle back button behavior correctly
- Test navigation flows thoroughly

## Form Handling

### Form Validation
- Use `Form` widget with `GlobalKey<FormState>`
- Implement proper validation logic
- Provide clear error messages
- Validate on submit and optionally on change
- Dispose form controllers properly

### Text Fields
- Always dispose `TextEditingController` instances
- Use `TextFormField` for forms with validation
- Implement proper keyboard types
- Use `inputFormatters` for input restrictions
- Provide helpful hint text and labels

## Accessibility

### General Guidelines
- Provide semantic labels for screen readers
- Ensure sufficient touch target sizes (minimum 48x48 dp)
- Support keyboard navigation
- Test with screen readers (TalkBack/VoiceOver)
- Ensure sufficient color contrast ratios

### Semantic Widgets
- Use `Semantics` widget for custom components
- Provide meaningful labels for interactive elements
- Implement proper focus management
- Support accessibility features (bold text, large text)

## Asset Management

### Images & Icons
- Store assets in organized directories (images/, icons/, etc.)
- Use flutter_gen or similar for type-safe asset access
- Provide multiple resolutions (1x, 2x, 3x) for raster images
- Use SVG for scalable graphics
- Optimize asset sizes

### Fonts & Localization
- Define custom fonts in pubspec.yaml
- Use proper font weights and styles
- Implement localization (flutter_localizations)
- Support multiple languages if needed
- Use proper text direction (LTR/RTL)

## Error Handling

### Exception Handling
- Use try-catch blocks for operations that may fail
- Provide user-friendly error messages
- Log errors appropriately
- Handle network errors gracefully
- Implement retry mechanisms where appropriate

### Null Safety
- Leverage Dart's null safety features
- Avoid using `!` operator unless absolutely certain
- Use null-aware operators (`?.`, `??`, `??=`)
- Provide default values when appropriate
- Handle null cases explicitly

## Testing

### Widget Tests
- Write widget tests for custom widgets
- Test different screen sizes and orientations
- Verify widget behavior and interactions
- Use `testWidgets` for Flutter-specific tests
- Mock dependencies appropriately

### Integration Tests
- Test complete user flows
- Verify navigation and routing
- Test form submissions and validations
- Ensure proper error handling

## Code Organization (MANDATORY - STRICTLY ENFORCED)

### File Structure (REQUIRED)
**See: [Clean Architecture Rules](clean_architecture.mdc#complete-project-structure) for detailed project structure**

```
lib/
├── components/           # Reusable UI components
│   ├── common/          # Shared components (SectionTitle, ClickableText, etc.)
│   │   ├── widget_name.dart
│   │   └── common.dart  # Barrel file
│   ├── feature_name/
│   │   ├── view/        # Widget implementations
│   │   ├── models/      # Data models
│   │   └── feature.dart # Barrel file
├── screens/             # Screen-level widgets
│   └── screen_name/
│       ├── view/
│       └── screen_name.dart
├── resources/           # Shared resources (colors, styles, assets)
└── application.dart     # App configuration
```

### Rules:
- ✅ **MUST** organize by feature or layer
- ✅ Keep related files together in the same directory
- ✅ **ALWAYS** use barrel files for clean exports
- ✅ **NEVER** mix business logic with UI code
- ✅ One main widget per file (max 500 lines)
- ✅ Private widgets in same file with leading underscore

### Component Reusability (MANDATORY)
- ✅ **MUST** create reusable components for repeated UI patterns
- ✅ Use optional parameters with default values for configurability
- ✅ Create model classes: `@immutable final class ModelName`
- ✅ Extract repeated patterns into `lib/components/common/`
- ✅ Examples: `SectionTitle`, `ClickableText`, `IconTextItem`, `SocialIconButton`
- ✅ Document all public components with `///` doc comments

**Every reusable component must:**
1. Have a descriptive name
2. Use `const` constructor
3. Have documentation comments
4. Be configurable via optional parameters
5. Be located in appropriate directory

### Widget Composition (MANDATORY)
- **ALWAYS** prefer composition over inheritance
- Create reusable, generic components with configurable parameters
- Use dependency injection for services and data
- **MUST** keep widgets focused solely on presentation (no business logic)
- Extract business logic to separate service/repository classes
- Use models to pass data between layers
- Example: Pass `List<FooterLinkModel>` instead of building links in widget

## Web-Specific (for Flutter Web)

### Web Optimization
- Optimize initial bundle size
- Use deferred loading for large features
- Test on multiple browsers
- Implement proper meta tags and SEO
- Handle browser back/forward buttons
- Use CanvasKit or HTML renderer appropriately

### Responsive Web Design
- Design for various screen sizes (mobile, tablet, desktop)
- Implement proper breakpoints
- Use hover states for desktop
- Handle touch and mouse input
- Test keyboard navigation

## Common Patterns

### Loading States
- Show loading indicators during async operations
- Use `FutureBuilder` or `StreamBuilder` for async data
- Implement skeleton screens for better UX
- Handle loading, success, and error states

### Empty States
- Show meaningful empty state messages
- Provide actions to populate empty states
- Use illustrations or icons for empty states

### Animations
- Use `AnimatedContainer`, `AnimatedOpacity` for simple animations
- Implement `AnimationController` for complex animations
- Keep animations smooth (60fps)
- Use curves for natural motion
- Dispose animation controllers properly

## Documentation Requirements (MANDATORY)

### Comments & Documentation
Every public widget/class MUST have documentation:

```dart
/// Brief one-line description of what this widget does.
///
/// Longer description explaining:
/// - When to use this widget
/// - What it's responsible for
/// - Any important behavioral notes
///
/// Customize via:
/// - [parameter1]: Description of parameter
/// - [parameter2]: Description of parameter
///
/// Example:
/// ```dart
/// SectionTitle(
///   text: 'Contact Information',
///   fontSize: 20,
///   color: AppColors.primary,
/// )
/// ```
///
/// See also:
/// - [RelatedWidget]: For related functionality
class SectionTitle extends StatelessWidget {
  /// Creates a section title with customizable styling.
  const SectionTitle({
    required this.text,
    super.key,
    this.fontSize = 18,
    this.color = AppColors.neutral800,
  });

  /// The text to display in the section title.
  final String text;

  /// The font size for the title text.
  /// 
  /// Defaults to 18.
  final double fontSize;

  // ... rest of implementation
}
```

### Documentation Rules:
- ✅ All public classes/widgets need `///` doc comments
- ✅ All public properties need doc comments
- ✅ Include usage examples for reusable components
- ✅ Link related widgets with `[WidgetName]` syntax
- ✅ Explain complex logic with inline comments
- ✅ Use `// TODO(name): description` for future work
- ✅ Keep comments up-to-date with code changes

### Private Members:
- Private widgets (`_WidgetName`) should have brief comments
- Complex private methods should have inline documentation
- Simple getters/setters don't need comments

### Dependencies
- Keep dependencies updated
- Review package quality and maintenance
- Minimize dependency count
- Use pub.dev scores as guidance
- Lock dependency versions appropriately

### Build & Deployment
- Test builds on target platforms
- Optimize release builds
- Use proper build flavors/configurations
- Implement CI/CD pipelines
- Test on real devices

## Anti-Patterns to Avoid (CRITICAL - ZERO TOLERANCE)

### ❌ FORBIDDEN - Will Fail Code Review:
1. **Use `setState` in `initState`** - Use `didChangeDependencies` or `addPostFrameCallback`
2. **Create stateful widgets unnecessarily** - Prefer `StatelessWidget`
3. **Ignore dispose methods** - Always dispose controllers, streams, subscriptions
4. **Nest more than 5 levels deep** - Extract to separate widgets
5. **Put business logic in widgets** - Use Cubits/Blocs/Services
6. **Hardcode colors/sizes/strings** - Use AppColors, constants, i18n
7. **Use `print()` for logging** - Use proper logging package
8. **Ignore linter warnings** - Fix ALL warnings before commit
9. **Create objects in build method** - Create once in constructor/getter
10. **Skip `const` on const-able widgets** - Linter enforces this
11. **Use `withOpacity()`** - Use `withValues(alpha: X)` instead
12. **Use `Container` for decoration only** - Use `DecoratedBox` or `ColoredBox`
13. **Import with relative paths for lib files** - Use package imports
14. **Leave files without newline at end** - Auto-fixed by formatter
15. **Mix business logic with UI** - Separation is MANDATORY

### ✅ REQUIRED - Enforced by Linter:
1. **Use `final` for all widget properties** - Immutability enforced
2. **Mark model classes with `@immutable final class`** - Type safety
3. **Use `const` constructors** - Performance optimization
4. **Document public APIs with `///`** - Self-documenting code
5. **Create reusable components** - DRY principle
6. **Use model classes for data** - Type safety and clarity
7. **Follow naming conventions** - Consistency enforced
8. **Keep files under 500 lines** - Maintainability
9. **Handle all error cases** - No silent failures
10. **Use semantic names** - Describe purpose, not implementation
11. **Dispose resources** - Memory leak prevention
12. **Add `@override` annotations** - Clarity and safety
13. **Use `super.key` in constructors** - Flutter convention
14. **Sort child properties last** - Flutter convention
15. **Use package imports** - Consistency enforced

### Pre-Commit Checklist (MANDATORY):
**See: [Dart Linter Rules](dart_linter.mdc#summary-checklist) for complete pre-commit checklist**

```bash
# Run before every commit
fvm dart format .              # Format all files
fvm dart analyze               # Check for errors
fvm dart fix --apply           # Auto-fix issues

# Verify:
# - Zero errors
# - Zero warnings  
# - Only info messages allowed (eol_at_end_of_file, lines_longer_than_80_chars)
```
