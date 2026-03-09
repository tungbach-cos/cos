import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:supabase/supabase.dart';

late final SupabaseClient supabase;

Middleware supabaseProvider = provider((context) => supabase);

Future<void> init(InternetAddress address, int port) async {
  supabase = SupabaseClient(
    'https://rxgthgfagjwshvbutpri.supabase.co',
    'sb_publishable_7c3ADXaT9Hz7AGRjDlLFKw_QahANbU_',
  );
}

Future<HttpServer> run(Handler handler, InternetAddress address, int port) {
  return serve(handler.use(supabaseProvider), address, port);
}
