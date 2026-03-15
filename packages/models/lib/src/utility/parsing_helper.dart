/// Shared utilities for model parsing (e.g. JSON/form values).
class ParsingHelper {
  ParsingHelper._();

  /// Parses a nullable int from JSON (handles num or string form values).
  static int? nullableIntFromJson(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    final s = value.toString().trim();
    return s.isEmpty ? null : int.tryParse(s);
  }

  /// Parses a nullable double from JSON (handles num or string form values).
  static double? nullableDoubleFromJson(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is num) return value.toDouble();
    final s = value.toString().trim();
    return s.isEmpty ? null : double.tryParse(s);
  }
}
