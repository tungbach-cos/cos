import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:domain/domain.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => _getUnits(context),
    HttpMethod.post => _postUnit(context),
    _ => Response(
      statusCode: HttpStatus.methodNotAllowed,
    ),
  };
}

Future<Response> _getUnits(RequestContext context) async {
  final unitRepository = context.read<UnitRepository>();
  final units = await unitRepository.getUnits();

  return Response.json(
    body: units.map((e) => e.toJson()).toList(),
  );
}

Future<Response> _postUnit(RequestContext context) async {
  final body = await context.request.json();
  if (body is! Map<String, dynamic>) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Request body must be a JSON object',
    );
  }
  final unitRepository = context.read<UnitRepository>();
  try {
    final unit = await unitRepository.createUnit(data: body);
    return Response.json(
      body: unit.toJson(),
      statusCode: HttpStatus.created,
    );
  } catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.toString(),
    );
  }
}
