import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:domain/domain.dart';
import 'package:models/models.dart';

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
  try {
    final unit = await unitRepository.getUnit(id: id);
    return Response.json(body: unit);
  } on UnitNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}

Future<Response> _patchUnit(RequestContext context, int id) async {
  try {
    final formData = await context.request.formData();
    final data = UnitRequestModel.fromJson(formData.fields);

    final unitRepository = context.read<UnitRepository>();
    final unit = await unitRepository.updateUnit(id: id, data: data);
    return Response.json(body: unit);
  } on FormatException catch (e) {
    return Response(statusCode: HttpStatus.badRequest, body: e.toString());
  } on UnitNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}

Future<Response> _deleteUnit(RequestContext context, int id) async {
  final unitRepository = context.read<UnitRepository>();
  try {
    await unitRepository.deleteUnit(id: id);
    return Response(statusCode: HttpStatus.noContent);
  } on UnitNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}
