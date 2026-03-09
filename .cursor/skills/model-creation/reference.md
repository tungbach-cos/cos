# Model Creation Reference

## JSON key naming

- Dart fields: camelCase (e.g. `fullDescription`, `createdAt`).
- JSON keys are generated with `field_rename: snake` (see `packages/models/build.yaml`), so camelCase becomes snake_case automatically (e.g. `createdAt` → `created_at`). Do **not** use `@JsonKey(name: '...')` when the key is just that snake_case form.
- Use `@JsonKey(name: '...')` only when the API/DB key is different (e.g. legacy or custom name).
- If the analyzer reports `invalid_annotation_target` on `@JsonKey`, add at the top of the file:
  `// ignore_for_file: invalid_annotation_target` with a one-line comment explaining Freezed factory params.

## Optional vs required

- Match the schema: nullable columns → `Type?`; non-nullable → `required Type`.
- Put all `required` parameters before optional ones to satisfy `always_put_required_named_parameters_first`.

## jsonb and lists

- **Object** (arbitrary JSON): `Map<String, dynamic>?`
- **Array of strings**: `List<String>?` — generated `fromJson` will use `(json['key'] as List<dynamic>?)?.map((e) => e as String).toList()`.
- **Array of objects**: Consider a separate Freezed model and `List<ThatModel>?`, or keep `List<Map<String, dynamic>>?` if structure is dynamic.

## Regeneration

- After changing a model file, always run from `packages/models`:
  `dart run build_runner build --delete-conflicting-outputs`
- Do not edit `*.freezed.dart` or `*.g.dart` by hand; they are generated.
