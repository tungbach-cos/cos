import 'dart:io';

/// API version. Prefers `VERSION` env (set at deploy from pubspec); otherwise
/// reads and parses `pubspec.yaml` when present (e.g. local dev from api/).
String get apiVersion {
  return _versionFromPubspecFile() ?? 'unknown';
}

String? _versionFromPubspecFile() {
  final file = File('${Directory.current.path}/pubspec.yaml');

  if (!file.existsSync()) return null;
  final content = file.readAsStringSync();
  final match = RegExp(
    r'^version:\s*([^\s#]+)',
    multiLine: true,
  ).firstMatch(content);
  return match?.group(1);
}
