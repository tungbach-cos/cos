/// Thrown when a product cannot be found by id.
final class ProductNotFoundException implements Exception {
  /// Creates a [ProductNotFoundException].
  const ProductNotFoundException({this.id});

  /// The product id that was not found, if known.
  final int? id;

  @override
  String toString() => id != null
      ? 'ProductNotFoundException: product $id not found'
      : 'ProductNotFoundException';
}
