import 'package:dart_frog/dart_frog.dart';
import 'package:supabase/supabase.dart';
import 'package:tungbach/datasource/product/product_datasource.dart';

import 'package:tungbach/datasource/product/product_datasrouce_impl.dart';

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(
        provider<ProductDatasource>(
          (context) => ProductDatasourceImpl(context.read<SupabaseClient>()),
        ),
      );
}
