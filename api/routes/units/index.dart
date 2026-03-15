import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:domain/domain.dart';
import 'package:models/models.dart';

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
  try {
    final formData = await context.request.formData();
    final data = UnitRequestModel.fromJson(formData.fields);

    if (data.name case String(isNotEmpty: false)) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'Field "name" is required',
      );
    }

    final unitRepository = context.read<UnitRepository>();
    final unit = await unitRepository.createUnit(data: data);
    return Response.json(
      body: unit,
      statusCode: HttpStatus.created,
    );
  } on FormatException catch (e) {
    return Response(statusCode: HttpStatus.badRequest, body: e.toString());
  } on UnitNotFoundException {
    return Response(statusCode: HttpStatus.notFound);
  } catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.toString(),
    );
  }
}
