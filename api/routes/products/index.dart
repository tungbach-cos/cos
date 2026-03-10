import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:datasource/datasource.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => _getProducts(context),
    _ => Response(
      statusCode: HttpStatus.methodNotAllowed,
    ),
  };
}

Future<Response> _getProducts(RequestContext context) async {
  final productDatasource = context.read<ProductDatasource>();
  final products = await productDatasource.getProducts();
  return Response.json(body: products);
}
