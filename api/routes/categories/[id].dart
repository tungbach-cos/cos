import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:domain/domain.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  final categoryId = int.tryParse(id);
  if (categoryId == null) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Invalid category id',
    );
  }
  return switch (context.request.method) {
    HttpMethod.get => _getCategory(context, categoryId),
    HttpMethod.patch => _patchCategory(context, categoryId),
    HttpMethod.delete => _deleteCategory(context, categoryId),
    _ => Response(
      statusCode: HttpStatus.methodNotAllowed,
    ),
  };
}

Future<Response> _getCategory(RequestContext context, int id) async {
  final categoryRepository = context.read<CategoryRepository>();
  final category = await categoryRepository.getCategory(id: id);
  if (category == null) {
    return Response(statusCode: HttpStatus.notFound);
  }
  return Response.json(body: category.toJson());
}

Future<Response> _patchCategory(RequestContext context, int id) async {
  final body = await context.request.json();
  if (body is! Map<String, dynamic>) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Request body must be a JSON object',
    );
  }
  final categoryRepository = context.read<CategoryRepository>();
  try {
    final category = await categoryRepository.updateCategory(
      id: id,
      data: body,
    );
    return Response.json(body: category.toJson());
  } catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.toString(),
    );
  }
}

Future<Response> _deleteCategory(RequestContext context, int id) async {
  final categoryRepository = context.read<CategoryRepository>();
  final category = await categoryRepository.getCategory(id: id);
  if (category == null) {
    return Response(statusCode: HttpStatus.notFound);
  }
  await categoryRepository.deleteCategory(id: id);
  return Response(statusCode: HttpStatus.noContent);
}
