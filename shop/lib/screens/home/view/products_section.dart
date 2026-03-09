import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/data/data.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/product_detail/view/product_detail_screen.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Container(
          color: AppColors.neutral200,
          padding: EdgeInsets.symmetric(
            vertical: screenSize.isDesktop
                ? 100
                : screenSize.isTablet
                ? 80
                : 60,
          ),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1268),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _SectionHeader(screenSize: screenSize),
                  Gap(screenSize.isDesktop ? 60 : 40),
                  _ProductsGrid(screenSize: screenSize),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Labels.featuredProducts,
          style: GoogleFonts.lora(
            fontSize: switch (screenSize) {
              .desktop => 48,
              .tablet => 40,
              .phone => 36,
              .mobile => 32,
            },
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: AppColors.neutral800,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(16),
        Text(
          Labels.featuredProductsSubtitle,
          style: GoogleFonts.inter(
            fontSize: switch (screenSize) {
              .desktop => 18,
              .tablet => 16,
              .phone => 16,
              .mobile => 14,
            },
            height: 1.6,
            color: AppColors.neutral600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ProductsGrid extends StatelessWidget {
  const _ProductsGrid({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = screenSize.isDesktop
            ? 3
            : screenSize.isTablet
            ? 2
            : 1;

        return Wrap(
          spacing: 24,
          runSpacing: 24,
          children: ProductRepositoryImpl.products
              .map(
                (product) => SizedBox(
                  width:
                      (constraints.maxWidth - (24 * (crossAxisCount - 1))) /
                      crossAxisCount,
                  child: ProductCard(
                    product: product,
                    variant: ProductCardVariant.related,
                    onTap: () => context.go(
                      '/${ProductDetailScreen.path}/${product.id}',
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
