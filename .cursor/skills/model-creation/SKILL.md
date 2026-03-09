---
name: model-creation
description: Creates and updates Dart data models with Freezed and JSON serialization in the models package. Use when adding or changing domain models, creating models from a database or API schema, or when the user refers to packages/models or model classes.
---

# Model Creation

## When to Use

- Adding a new model or changing existing ones in `packages/models`
- Generating or updating models from a database schema or API contract
- User asks to add a model, create a Freezed model, or align models with a schema

## Conventions

1. **Naming**: Class and file use the `*Model` suffix (e.g. `ProductModel` in `product_model.dart`).
2. **Location**: One model per file under `packages/models/lib/src/`; export from `lib/src/models.dart`.
3. **Freezed**: Use `@Freezed(fromJson: true, toJson: true)`, factory constructor, and `factory X.fromJson`.
4. **Parameter order**: Required parameters first, then optional.
5. **JSON keys**: Generated with `field_rename: snake` (Dart camelCase → JSON snake_case). Do **not** use `@JsonKey(name: 'snake_case')` when the JSON key is just the snake_case form of the field (e.g. `createdAt` → `created_at`). Use `@JsonKey(name: '...')` only when the JSON key differs from that (e.g. custom or legacy name).
6. **Docs**: Class-level doc comment; short doc on the factory and on `fromJson`.

## File Template

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_model.freezed.dart';
part 'example_model.g.dart';

/// One-line description of the entity.
@Freezed(fromJson: true, toJson: true)
class ExampleModel with _$ExampleModel {
  /// Creates an [ExampleModel] from JSON.
  const factory ExampleModel({
    required int id,
    required String name,
    DateTime? createdAt,
  }) = _ExampleModel;

  /// Parses [ExampleModel] from a JSON map.
  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);
}
```

Only when you use `@JsonKey(name: '...')` for a custom key, add at the top (analyzer false positive):

```dart
// Freezed factory params use @JsonKey; analyzer does not recognize that.
// ignore_for_file: invalid_annotation_target
```

## Type Mapping (Schema → Dart)

| Schema / API type | Dart type | Notes |
|-------------------|-----------|--------|
| int8 / integer PK/FK | `int` | required or nullable per schema |
| text (required) | `String` | |
| text (nullable) | `String?` | |
| jsonb (object) | `Map<String, dynamic>?` | |
| jsonb (array of strings) | `List<String>?` | |
| numeric | `double?` | or use a decimal package if needed |
| timestamptz | `DateTime?` | ISO 8601 strings in JSON |

JSON keys are generated as snake_case from Dart field names (`field_rename: snake` in `build.yaml`). Use `@JsonKey(name: '...')` only when the API/DB key is different from that (e.g. `fullDescription` → `full_description` is automatic; no `@JsonKey` needed).

## Workflow

1. **New model**: Create `lib/src/<name>_model.dart` with the template; add `export '<name>_model.dart';` to `lib/src/models.dart`.
2. **Edit existing**: Change the Freezed factory and/or fields; add `@JsonKey(name: '...')` only for keys that differ from the auto-generated snake_case name.
3. **Regenerate**: From `packages/models` run:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
4. **Verify**: Run `dart analyze` in `packages/models`.

## Dependencies

The `packages/models` pubspec must include:

- **dependencies**: `freezed_annotation`, `json_annotation`
- **dev_dependencies**: `build_runner`, `freezed`, `json_serializable`

See `packages/models/pubspec.yaml` for current versions.

## Reference

- Type mapping and edge cases: [reference.md](reference.md)
- Existing examples: `packages/models/lib/src/product_model.dart`, `category_model.dart`, `unit_model.dart`
