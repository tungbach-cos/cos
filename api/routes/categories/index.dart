import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:domain/domain.dart';
import 'package:models/models.dart';

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
  try {
    final formData = await context.request.formData();
    final data = CategoryRequestModel.fromJson(formData.fields);

    if (data.name case String(isNotEmpty: false)) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'Field "name" is required',
      );
    }

    final categoryRepository = context.read<CategoryRepository>();
    final category = await categoryRepository.createCategory(data: data);
    return Response.json(
      body: category,
      statusCode: HttpStatus.created,
    );
  } on FormatException catch (e) {
    return Response(statusCode: HttpStatus.badRequest, body: e.toString());
  } on CategoryNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.toString(),
    );
  }
}
