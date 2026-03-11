import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:datasource/datasource.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => _getProducts(context),
    HttpMethod.post => _postProduct(context),
    _ => Response(
      statusCode: HttpStatus.methodNotAllowed,
    ),
  };
}

Future<Response> _getProducts(RequestContext context) async {
  final productDatasource = context.read<ProductDatasource>();
  final products = await productDatasource.getProducts();
  return Response.json(
    body: products.map((e) => e.toJson()).toList(),
  );
}

Future<Response> _postProduct(RequestContext context) async {
  final body = await context.request.json();
  if (body is! Map<String, dynamic>) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Request body must be a JSON object',
    );
  }
  final productDatasource = context.read<ProductDatasource>();
  try {
    final product = await productDatasource.createProduct(data: body);
    return Response.json(
      body: product.toJson(),
      statusCode: HttpStatus.created,
    );
  } catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.toString(),
    );
  }
}
