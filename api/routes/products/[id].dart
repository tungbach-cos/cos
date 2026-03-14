import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:domain/domain.dart';
import 'package:models/models.dart';

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
  final productRepository = context.read<ProductRepository>();
  try {
    final product = await productRepository.getProduct(id: id);
    return Response.json(body: product);
  } on ProductNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}

Future<Response> _patchProduct(RequestContext context, int id) async {
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

  final categoryId = categoryIdStr != null && categoryIdStr.isNotEmpty
      ? int.tryParse(categoryIdStr)
      : null;
  final unitId = unitIdStr != null && unitIdStr.isNotEmpty
      ? int.tryParse(unitIdStr)
      : null;
  final price = priceStr != null && priceStr.isNotEmpty
      ? double.tryParse(priceStr)
      : null;

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
    } catch (_) {
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
    final product = await productRepository.updateProduct(
      id: id,
      data: data,
      image: image,
    );
    return Response.json(body: product);
  } on ProductNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}

Future<Response> _deleteProduct(RequestContext context, int id) async {
  final productRepository = context.read<ProductRepository>();
  try {
    await productRepository.deleteProduct(id: id);
    return Response(statusCode: HttpStatus.noContent);
  } on ProductNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}
