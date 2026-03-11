import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:datasource/datasource.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  final productId = int.tryParse(id);
  if (productId == null) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Invalid product id',
    );
  }
  return switch (context.request.method) {
    HttpMethod.get => _getProduct(context, productId),
    HttpMethod.patch => _patchProduct(context, productId),
    HttpMethod.delete => _deleteProduct(context, productId),
    _ => Response(
      statusCode: HttpStatus.methodNotAllowed,
    ),
  };
}

Future<Response> _getProduct(RequestContext context, int id) async {
  final productDatasource = context.read<ProductDatasource>();
  final product = await productDatasource.getProduct(id: id);
  if (product == null) {
    return Response(statusCode: HttpStatus.notFound);
  }
  return Response.json(body: product);
}

Future<Response> _patchProduct(RequestContext context, int id) async {
  final body = await context.request.json();
  if (body is! Map<String, dynamic>) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Request body must be a JSON object',
    );
  }
  final productDatasource = context.read<ProductDatasource>();
  try {
    final product = await productDatasource.updateProduct(id: id, data: body);
    return Response.json(body: product.toJson());
  } catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.toString(),
    );
  }
}

Future<Response> _deleteProduct(RequestContext context, int id) async {
  final productDatasource = context.read<ProductDatasource>();
  final product = await productDatasource.getProduct(id: id);
  if (product == null) {
    return Response(statusCode: HttpStatus.notFound);
  }
  await productDatasource.deleteProduct(id: id);
  return Response(statusCode: HttpStatus.noContent);
}
