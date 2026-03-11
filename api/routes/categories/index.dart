import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:domain/domain.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final categoryRepository = context.read<CategoryRepository>();
  final categories = await categoryRepository.getCategories();

  return Response.json(
    body: categories.map((e) => e.toJson()).toList(),
  );
}
