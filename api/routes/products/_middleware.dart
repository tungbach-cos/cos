import 'package:dart_frog/dart_frog.dart';
import 'package:datasource/datasource.dart';
import 'package:tungbach/core/di/di.dart' show sl;

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(
        provider<ProductDatasource>(
          (context) => sl<ProductDatasource>(),
        ),
      );
}
