import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:domain/domain.dart';
import 'package:models/models.dart';
import 'package:tungbach/core/core.dart';

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
  final productRepository = context.read<ProductRepository>();
  final products = await productRepository.getProducts();
  return Response.json(
    body: products.map((e) => e.toJson()).toList(),
  );
}

Future<Response> _postProduct(RequestContext context) async {
  try {
    final formData = await context.request.formData();
    final data = ProductRequestModel.fromJson(formData.fields);
    final ProductRequestModel(
      :name,
      :categoryId,
      :unitId,
      :sku,
      :features,
      :specifications,
    ) = data;

    if (name case String(isNotEmpty: false)) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'Field "name" is required',
      );
    }

    // Validate Category's id, must be a valid integer
    if (categoryId == null) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'Field "category_id" is missing or invalid',
      );
    }
    // Validate Unit's id, must be a valid integer
    if (unitId == null) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'Field "unit_id" is missing or invalid',
      );
    }
    // Validate SKU, must be a non-empty string
    if (sku case String(isNotEmpty: false)) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'Field "sku" is required',
      );
    }

    final image = await RequestHelper.parseFileFromFormData(
      formData,
      fileName: data.sku ?? '',
    );

    final productRepository = context.read<ProductRepository>();
    final product = await productRepository.createProduct(
      data: data,
      image: image,
    );
    return Response.json(
      body: product,
      statusCode: HttpStatus.created,
    );
  } on FormatException catch (e) {
    return Response(statusCode: HttpStatus.badRequest, body: e.toString());
  } on ProductNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.toString(),
    );
  }
}
