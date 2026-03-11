import 'package:dart_frog/dart_frog.dart';
import 'package:domain/domain.dart';
import 'package:tungbach/core/di/di.dart' show sl;

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(
        provider<UnitRepository>(
          (context) => sl<UnitRepository>(),
        ),
      );
}
