import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/data/data.dart';
import 'package:tungbach/injection.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/contact/view/contact_screen.dart';
import 'package:tungbach/screens/home/view/home_screen.dart';
import 'package:tungbach/screens/product_detail/cubit/product_detail_cubit.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Product detail screen displaying comprehensive product information.
///
/// Shows product details including description, features, specifications,
/// and related products. Accessed via route with product ID parameter.
class ProductDetailScreen extends StatelessWidget {
  /// Creates a product detail screen.
  const ProductDetailScreen({required this.productId, super.key});

  /// Route path for this screen.
  static String path = 'product';

  /// The product ID from the route parameter.
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: Key(productId),
      create: (context) {
        final cubit = getIt<ProductDetailCubit>();
        unawaited(cubit.loadProduct(productId));
        return cubit;
      },
      child: const _ProductDetailContent(),
    );
  }
}

/// Main content section of the product detail page.
class _ProductDetailContent extends StatelessWidget {
  const _ProductDetailContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        return CustomScaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                state.when(
                  initial: () => const _LoadingView(),
                  loading: () => const _LoadingView(),
                  success: (product, relatedProducts, companyInfo) => Column(
                    children: [
                      _ProductDetailSection(product: product),
                      _RelatedProductsSection(
                        relatedProducts: relatedProducts,
                      ),
                    ],
                  ),
                  notFound: () => const _NotFoundView(),
                  failure: (error) => _ErrorView(error: error),
                ),
                const Footer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Loading view while fetching product data
class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}

/// View shown when product is not found
class _NotFoundView extends StatelessWidget {
  const _NotFoundView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Labels.productNotFound,
              style: GoogleFonts.lora(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.neutral800,
              ),
            ),
            const Gap(24),
            Button(
              text: Labels.backToHome,
              onTap: () => context.go('/${HomeScreen.path}'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Error view shown when there's an error loading the product
class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red.shade700,
            ),
            const Gap(24),
            Text(
              Labels.errorOccurred,
              style: GoogleFonts.lora(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.neutral800,
              ),
            ),
            const Gap(12),
            Text(
              error,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: AppColors.neutral600,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(24),
            Button(
              text: Labels.tryAgain,
              onTap: () => context.read<ProductDetailCubit>().loadProduct(
                (context.widget as ProductDetailScreen).productId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Product detail section with all product information
class _ProductDetailSection extends StatelessWidget {
  const _ProductDetailSection({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Container(
          color: AppColors.neutral100,
          padding: EdgeInsets.symmetric(
            vertical: screenSize.isDesktop
                ? 80
                : screenSize.isTablet
                ? 60
                : 40,
          ),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1268),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: screenSize.isDesktop
                  ? _DesktopLayout(product: product, screenSize: screenSize)
                  : _MobileLayout(product: product, screenSize: screenSize),
            ),
          ),
        );
      },
    );
  }
}

/// Desktop layout with side-by-side image and details.
class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({required this.product, required this.screenSize});

  final ProductModel product;
  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _ProductImage(product: product)),
        const Gap(60),
        Expanded(
          flex: 7,
          child: _ProductInfo(product: product, screenSize: screenSize),
        ),
      ],
    );
  }
}

/// Mobile/tablet layout with stacked image and details.
class _MobileLayout extends StatelessWidget {
  const _MobileLayout({required this.product, required this.screenSize});

  final ProductModel product;
  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ProductImage(product: product),
        const Gap(40),
        _ProductInfo(product: product, screenSize: screenSize),
      ],
    );
  }
}

/// Product image display widget.
class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.neutral200,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neutral400),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: AppAssets.images.logo.image(
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

/// Product information section.
class _ProductInfo extends StatelessWidget {
  const _ProductInfo({required this.product, required this.screenSize});

  final ProductModel product;
  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProductHeader(product: product, screenSize: screenSize),
        const Gap(32),
        _ProductDescription(product: product),
        const Gap(40),
        _ProductFeatures(product: product),
        const Gap(40),
        _ProductSpecifications(product: product),
        const Gap(40),
        _ContactButtons(screenSize: screenSize),
      ],
    );
  }
}

/// Product header with category, name, and price.
class _ProductHeader extends StatelessWidget {
  const _ProductHeader({required this.product, required this.screenSize});

  final ProductModel product;
  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.category,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
            letterSpacing: 0.5,
          ),
        ),
        const Gap(12),
        Text(
          product.name,
          style: GoogleFonts.lora(
            fontSize: switch (screenSize) {
              .desktop => 42,
              .tablet => 36,
              .phone => 32,
              .mobile => 28,
            },
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: AppColors.neutral800,
          ),
        ),
        if (product.price != null) ...[
          const Gap(16),
          Row(
            children: [
              Text(
                Labels.price,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: AppColors.neutral600,
                ),
              ),
              Text(
                '${product.price}'
                '${product.unit != null ? ' / ${product.unit}' : ''}',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

/// Product description section.
class _ProductDescription extends StatelessWidget {
  const _ProductDescription({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(text: Labels.productDescription),
        const Gap(16),
        Text(
          product.fullDescription,
          style: GoogleFonts.inter(
            fontSize: 16,
            height: 1.7,
            color: AppColors.neutral700,
          ),
        ),
      ],
    );
  }
}

/// Product features list.
class _ProductFeatures extends StatelessWidget {
  const _ProductFeatures({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(text: Labels.productFeatures),
        const Gap(16),
        ...product.features.map(
          (feature) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: IconTextItem(
              icon: Icons.check_circle,
              text: feature,
              iconSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

/// Product specifications table.
class _ProductSpecifications extends StatelessWidget {
  const _ProductSpecifications({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(text: Labels.productSpecifications),
        const Gap(16),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: product.specifications.entries
                .map(
                  (entry) => _SpecificationRow(
                    label: entry.key,
                    value: entry.value,
                    isLast:
                        entry.key == product.specifications.entries.last.key,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

/// Single row in the specifications table.
class _SpecificationRow extends StatelessWidget {
  const _SpecificationRow({
    required this.label,
    required this.value,
    required this.isLast,
  });

  final String label;
  final String value;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: AppColors.neutral400)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutral700,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: AppColors.neutral600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Contact buttons for purchasing or inquiring.
class _ContactButtons extends StatelessWidget {
  const _ContactButtons({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        if (screenSize.isDesktop || screenSize.isTablet) {
          return const Row(
            children: [
              Expanded(child: _ContactButton()),
              Gap(16),
              Expanded(child: _CallButton()),
            ],
          );
        }

        return const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ContactButton(),
            Gap(12),
            _CallButton(),
          ],
        );
      },
    );
  }
}

/// Contact button for pricing inquiries.
class _ContactButton extends StatelessWidget {
  const _ContactButton();

  @override
  Widget build(BuildContext context) {
    return Button(
      text: Labels.contactForPrice,
      buttonType: .filled,
      onTap: () => context.go('/${ContactScreen.path}'),
    );
  }
}

/// Call button for immediate contact.
class _CallButton extends StatelessWidget {
  const _CallButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        String? phoneNumber;
        // Try to extract the phone number directly, if available
        state.maybeWhen(
          success: (product, relatedProducts, companyInfo) {
            if (companyInfo.phoneNumbers.isNotEmpty) {
              phoneNumber = companyInfo.phoneNumbers.first;
            }
          },
          orElse: () {},
        );

        return Button(
          text: Labels.callNow,
          buttonType: .outlined,
          onTap: phoneNumber != null
              ? () => _makePhoneCall(context, phoneNumber!)
              : () => _showErrorSnackBar(
                  context,
                  state is ProductDetailLoading
                      ? 'Đang tải thông tin liên hệ...'
                      : 'Không tìm thấy số điện thoại',
                ),
        );
      },
    );
  }

  Future<void> _makePhoneCall(
    BuildContext context,
    String phoneNumber,
  ) async {
    final url = 'tel:$phoneNumber';

    try {
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      } else {
        if (context.mounted) {
          _showErrorSnackBar(context, 'Không thể thực hiện cuộc gọi');
        }
      }
    } on Exception catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context, 'Lỗi khi thực hiện cuộc gọi: $e');
      }
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}

/// Related products section at the bottom of the page.
class _RelatedProductsSection extends StatelessWidget {
  const _RelatedProductsSection({required this.relatedProducts});

  final List<ProductModel> relatedProducts;

  @override
  Widget build(BuildContext context) {
    if (relatedProducts.isEmpty) {
      return const SizedBox.shrink();
    }

    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Container(
          color: AppColors.neutral200,
          padding: EdgeInsets.symmetric(
            vertical: screenSize.isDesktop
                ? 80
                : screenSize.isTablet
                ? 60
                : 40,
          ),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1268),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    Labels.relatedProducts,
                    style: GoogleFonts.lora(
                      fontSize: switch (screenSize) {
                        .desktop => 36,
                        .tablet => 32,
                        .phone => 28,
                        .mobile => 24,
                      },
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutral800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(screenSize.isDesktop ? 48 : 32),
                  _RelatedProductsGrid(
                    products: relatedProducts,
                    screenSize: screenSize,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Grid of related product cards.
class _RelatedProductsGrid extends StatelessWidget {
  const _RelatedProductsGrid({
    required this.products,
    required this.screenSize,
  });

  final List<ProductModel> products;
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
          children: products
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
