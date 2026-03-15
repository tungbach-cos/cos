import 'package:dart_frog/dart_frog.dart';
import 'package:domain/domain.dart';
import 'package:tungbach/core/core.dart' show sl;

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(
        provider<CategoryRepository>(
          (context) => sl<CategoryRepository>(),
        ),
      );
}
