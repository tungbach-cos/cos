import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:domain/domain.dart';
import 'package:models/models.dart';

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
  final formData = await context.request.formData();
  final {
    'name': String? name,
    'category_id': String? categoryIdStr,
    'unit_id': String? unitIdStr,
    'sku': String? sku,
    'full_description': String? fullDescription,
    'features': String? featuresStr,
    'specifications': String? specificationsStr,
    'price': String? priceStr,
  } = formData.fields;

  if (name case String(isNotEmpty: false)) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Field "name" is required',
    );
  }

  final categoryId = int.tryParse(categoryIdStr ?? '');
  // Validate Category's id, must be a valid integer
  if (categoryId == null) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Field "category_id" is missing or invalid',
    );
  }
  final unitId = int.tryParse(unitIdStr ?? '');
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

  final price = double.tryParse(priceStr ?? '0');

  List<String>? features;
  if (featuresStr case String(isNotEmpty: true)) {
    try {
      final decoded = jsonDecode(featuresStr) as List<dynamic>?;
      features = decoded?.map((e) => e.toString()).toList();
    } catch (_) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'Field "features" must be a JSON array of strings',
      );
    }
  }

  Map<String, dynamic>? specifications;
  if (specificationsStr case String(isNotEmpty: true)) {
    try {
      specifications = jsonDecode(specificationsStr) as Map<String, dynamic>?;
    } catch (e) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'Field "specifications" must be a JSON object',
      );
    }
  }

  final data = ProductRequestModel(
    name: name,
    categoryId: categoryId,
    unitId: unitId,
    sku: sku,
    fullDescription: fullDescription,
    features: features,
    specifications: specifications,
    price: price,
  );

  FileRequestModel? image;
  final uploadedFile = formData.files['image'];
  if (uploadedFile != null) {
    final bytes = await uploadedFile.readAsBytes();
    final ContentType(:mimeType) = uploadedFile.contentType;
    final skuValue = data.sku ?? '';
    image = FileRequestModel(
      bytes: bytes,
      contentType: mimeType,
      name: skuValue,
    );
  }

  final productRepository = context.read<ProductRepository>();
  try {
    final product = await productRepository.createProduct(
      data: data,
      image: image,
    );
    return Response.json(
      body: product,
      statusCode: HttpStatus.created,
    );
  } on ProductNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.toString(),
    );
  }
}
