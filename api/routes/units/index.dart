import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'package:domain/domain.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final unitRepository = context.read<UnitRepository>();
  final units = await unitRepository.getUnits();

  return Response.json(
    body: units.map((e) => e.toJson()).toList(),
  );
}
