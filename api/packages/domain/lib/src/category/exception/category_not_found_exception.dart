/// Thrown when a category cannot be found by id.
final class CategoryNotFoundException implements Exception {
  /// Creates a [CategoryNotFoundException].
  const CategoryNotFoundException({this.id});

  /// The category id that was not found, if known.
  final int? id;

  @override
  String toString() => id != null
      ? 'CategoryNotFoundException: category $id not found'
      : 'CategoryNotFoundException';
}
