---
name: dart-frog
description: Build and work with Dart Frog API routes, middleware, and request handling. Use when creating or editing Dart Frog routes, middleware, form data, file uploads, dependency injection via context.read, or when the user mentions dart_frog, api routes, or Dart backend.
---

# Dart Frog

Expert guidance for the Dart Frog backend framework: routes, middleware, request/response, and DI.

## Route structure

- **File-based routing**: `routes/` mirrors URLs. `routes/products/index.dart` → `GET/POST /products`; `routes/products/[id].dart` → `GET/PATCH/DELETE /products/:id`.
- **Handler signature**: `Future<Response> onRequest(RequestContext context)` or `Response onRequest(...)` for sync. For dynamic segments: `onRequest(RequestContext context, String id)`.
- **Method dispatch**: Use `switch (context.request.method)` and handle `HttpMethod.get`, `HttpMethod.post`, `HttpMethod.patch`, `HttpMethod.delete`; return `Response(statusCode: HttpStatus.methodNotAllowed)` for others.

## Request handling

### JSON body
```dart
final body = await context.request.json();
if (body is! Map<String, dynamic>) {
  return Response(statusCode: HttpStatus.badRequest, body: 'Expected JSON object');
}
```

### Form data (multipart)
```dart
final formData = await context.request.formData();
final { 'field_name': String? value } = formData.fields;
// Optional file: formData.files['key'] → UploadedFile (readAsBytes(), contentType)
```

### File uploads
- `formData.files['key']` returns `UploadedFile?`. Use `uploadedFile.readAsBytes()` and `uploadedFile.contentType` (e.g. `ContentType(:mimeType)` for `mimeType` string).

## Dependency injection

- **Provide in middleware**: `handler.use(provider<MyRepo>((context) => sl<MyRepo>()));`
- **Read in route**: `final repo = context.read<MyRepository>();`
- Wire external packages (e.g. GetIt/sl) in `main.dart` or an `init` callback; use middleware only to expose instances to `context.read<T>()`.

## Response patterns

- **JSON**: `Response.json(body: object)` (object may be `Map` or model with `toJson()`). For status: `Response.json(body: ..., statusCode: HttpStatus.created)`.
- **Status only**: `Response(statusCode: HttpStatus.noContent)` or `Response(statusCode: HttpStatus.notFound)`.
- **Error body**: `Response(statusCode: HttpStatus.badRequest, body: message)`.
- Prefer returning JSON-serializable data (e.g. `product.toJson()` or `body: product` if the framework supports it) and consistent status codes (404 for not found, 400 for validation, 500 for server errors).

## Dynamic route parameters

- File `routes/products/[id].dart` → parameter `id` (String). Parse with `int.tryParse(id)`; return 400 if invalid before calling repository.
- Use the same `RequestContext context` and add positional parameters for each segment.

## Middleware

- **Per-route**: `routes/products/_middleware.dart` applies to `/products` and children. Use `Handler middleware(Handler handler) => handler.use(...).use(...);`
- **Built-in**: `requestLogger()` for request logging.
- **Provider**: `provider<T>((context) => instance)` so routes can `context.read<T>()`.

## Conventions

- Use `dart:io` for `HttpStatus` when needed.
- Keep route handlers thin: parse request, call repository or service, return response.
- Catch domain exceptions (e.g. `ProductNotFoundException`) and map to 404; avoid leaking stack traces to clients.
- For multipart create/update, validate required fields and return 400 with a clear message when invalid.

## Build and deploy

- **Local**: `dart_frog dev` (from `api/` or project root with correct path).
- **Production build**: `dart_frog build` (output in `build/`). Use that output for container or server deploy (e.g. Cloud Run with `--source build`).
- See `.cursor/commands/deploy-api.md` and `.cursor/skills/api-deployment-guidelines/SKILL.md` for this project’s API deployment.

## Checklist for new routes

- [ ] Place file under `routes/` (index vs `[param]`)
- [ ] Handle allowed methods and return 405 for others
- [ ] Validate path/query/body and return 400 when invalid
- [ ] Use `context.read<T>()` for repos; provide in `_middleware.dart` if needed
- [ ] Return JSON or appropriate body and status code (200, 201, 204, 400, 404, 500)
