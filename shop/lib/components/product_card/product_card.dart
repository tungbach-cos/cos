import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/button/button.dart';
import 'package:tungbach/data/data.dart';
import 'package:tungbach/resources/resources.dart';

/// Reusable product card widget with hover effects.
///
/// Displays product information in a card format with interactive hover states.
/// Supports different layouts for shop and related products.
///
/// Example:
/// ```dart
/// ProductCard(
///   product: product,
///   variant: ProductCardVariant.shop,
///   onTap: () => context.go('/product/${product.id}'),
/// )
/// ```
class ProductCard extends StatefulWidget {
  /// Creates a product card.
  const ProductCard({
    required this.product,
    required this.onTap,
    super.key,
    this.variant = ProductCardVariant.shop,
    this.buttonText,
  });

  /// The product to display.
  final ProductModel product;

  /// Callback when card is tapped.
  final VoidCallback onTap;

  /// The variant/style of the card.
  final ProductCardVariant variant;

  /// Custom button text. If null, uses default based on variant.
  final String? buttonText;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isShopVariant = widget.variant == ProductCardVariant.shop;
    final imageHeight = isShopVariant ? 240.0 : 200.0;
    final logoSize = isShopVariant ? 100.0 : 80.0;
    final nameFontSize = isShopVariant ? 22.0 : 20.0;
    final showCategoryBadge = isShopVariant;
    final showPrice = isShopVariant && widget.product.price != null;
    final buttonText =
        widget.buttonText ??
        (isShopVariant ? 'Xem Chi Tiết' : Labels.viewDetails);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? AppColors.primary : AppColors.neutral400,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.neutral800.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Product Image
              Container(
                height: imageHeight,
                decoration: const BoxDecoration(
                  color: AppColors.neutral300,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: AppAssets.images.logo.image(
                        width: logoSize,
                        height: logoSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                    if (showCategoryBadge)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.product.category,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral100,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!showCategoryBadge) ...[
                      Text(
                        widget.product.category,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      const Gap(8),
                    ],
                    Text(
                      widget.product.name,
                      style: GoogleFonts.lora(
                        fontSize: nameFontSize,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutral800,
                      ),
                    ),
                    const Gap(12),
                    Text(
                      widget.product.shortDescription,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        height: 1.6,
                        color: AppColors.neutral600,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (showPrice) ...[
                      const Gap(16),
                      Row(
                        children: [
                          const Icon(
                            Icons.paid_outlined,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          const Gap(6),
                          Text(
                            widget.product.price!,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                    const Gap(20),
                    Button(
                      text: buttonText,
                      buttonType: _isHovered ? .primary : .outlined,
                      onTap: widget.onTap,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Variant styles for product cards.
enum ProductCardVariant {
  /// Shop variant with larger image, category badge, and price.
  shop,

  /// Related product variant with smaller image and category text.
  related,
}
