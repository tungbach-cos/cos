/// Thrown when a unit cannot be found by id.
final class UnitNotFoundException implements Exception {
  /// Creates a [UnitNotFoundException].
  const UnitNotFoundException({this.id});

  /// The unit id that was not found, if known.
  final int? id;

  @override
  String toString() => id != null
      ? 'UnitNotFoundException: unit $id not found'
      : 'UnitNotFoundException';
}
