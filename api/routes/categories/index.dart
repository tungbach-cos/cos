import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:domain/domain.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => _getCategories(context),
    HttpMethod.post => _postCategory(context),
    _ => Response(
      statusCode: HttpStatus.methodNotAllowed,
    ),
  };
}

Future<Response> _getCategories(RequestContext context) async {
  final categoryRepository = context.read<CategoryRepository>();
  final categories = await categoryRepository.getCategories();

  return Response.json(
    body: categories.map((e) => e.toJson()).toList(),
  );
}

Future<Response> _postCategory(RequestContext context) async {
  final body = await context.request.json();
  if (body is! Map<String, dynamic>) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Request body must be a JSON object',
    );
  }
  final categoryRepository = context.read<CategoryRepository>();
  try {
    final category = await categoryRepository.createCategory(data: body);
    return Response.json(
      body: category.toJson(),
      statusCode: HttpStatus.created,
    );
  } catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.toString(),
    );
  }
}
