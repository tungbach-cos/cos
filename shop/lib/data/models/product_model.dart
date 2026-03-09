import 'package:flutter/foundation.dart';

/// Represents a product with all its details.
///
/// This model is used throughout the app to display product information
/// in lists, cards, and detail pages.
@immutable
final class ProductModel {
  /// Creates a product model.
  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.shortDescription,
    required this.fullDescription,
    required this.features,
    required this.specifications,
    this.imageUrl,
    this.price,
    this.unit,
  });

  /// Unique identifier for the product.
  final String id;

  /// Product name in Vietnamese.
  final String name;

  /// Product category (e.g., 'Phân Bón', 'Thức Ăn Chăn Nuôi').
  final String category;

  /// Brief description shown in product cards.
  final String shortDescription;

  /// Detailed description shown on product detail page.
  final String fullDescription;

  /// List of product features/benefits.
  final List<String> features;

  /// Product specifications as key-value pairs.
  final Map<String, String> specifications;

  /// Optional image URL for the product.
  final String? imageUrl;

  /// Optional price information.
  final String? price;

  /// Optional unit of measurement (e.g., 'kg', 'bao', 'tấn').
  final String? unit;

  /// Creates a URL-friendly slug from the product ID.
  String get slug => id.toLowerCase().replaceAll(' ', '-');
}
