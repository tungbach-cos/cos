import 'package:dart_frog/dart_frog.dart';
import 'package:tungbach/version.dart' show apiVersion;

Response onRequest(RequestContext context) {
  return Response.json(body: {'version': apiVersion});
}
