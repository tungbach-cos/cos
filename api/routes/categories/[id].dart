import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:domain/domain.dart';
import 'package:models/models.dart';

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
  try {
    final category = await categoryRepository.getCategory(id: id);
    return Response.json(body: category);
  } on CategoryNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}

Future<Response> _patchCategory(RequestContext context, int id) async {
  try {
    final formData = await context.request.formData();
    final data = CategoryRequestModel.fromJson(formData.fields);

    final categoryRepository = context.read<CategoryRepository>();
    final category = await categoryRepository.updateCategory(
      id: id,
      data: data,
    );
    return Response.json(body: category);
  } on FormatException catch (e) {
    return Response(statusCode: HttpStatus.badRequest, body: e.toString());
  } on CategoryNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}

Future<Response> _deleteCategory(RequestContext context, int id) async {
  final categoryRepository = context.read<CategoryRepository>();
  try {
    await categoryRepository.deleteCategory(id: id);
    return Response(statusCode: HttpStatus.noContent);
  } on CategoryNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}
