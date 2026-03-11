import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:domain/domain.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  final unitId = int.tryParse(id);
  if (unitId == null) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Invalid unit id',
    );
  }
  return switch (context.request.method) {
    HttpMethod.get => _getUnit(context, unitId),
    HttpMethod.patch => _patchUnit(context, unitId),
    HttpMethod.delete => _deleteUnit(context, unitId),
    _ => Response(
      statusCode: HttpStatus.methodNotAllowed,
    ),
  };
}

Future<Response> _getUnit(RequestContext context, int id) async {
  final unitRepository = context.read<UnitRepository>();
  final unit = await unitRepository.getUnit(id: id);
  if (unit == null) {
    return Response(statusCode: HttpStatus.notFound);
  }
  return Response.json(body: unit.toJson());
}

Future<Response> _patchUnit(RequestContext context, int id) async {
  final body = await context.request.json();
  if (body is! Map<String, dynamic>) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: 'Request body must be a JSON object',
    );
  }
  final unitRepository = context.read<UnitRepository>();
  try {
    final unit = await unitRepository.updateUnit(id: id, data: body);
    return Response.json(body: unit.toJson());
  } catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.toString(),
    );
  }
}

Future<Response> _deleteUnit(RequestContext context, int id) async {
  final unitRepository = context.read<UnitRepository>();
  final unit = await unitRepository.getUnit(id: id);
  if (unit == null) {
    return Response(statusCode: HttpStatus.notFound);
  }
  await unitRepository.deleteUnit(id: id);
  return Response(statusCode: HttpStatus.noContent);
}
