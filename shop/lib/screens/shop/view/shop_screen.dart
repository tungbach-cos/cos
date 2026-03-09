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
import 'package:tungbach/screens/product_detail/view/product_detail_screen.dart';
import 'package:tungbach/screens/shop/cubit/shop_cubit.dart';

/// Shop screen displaying all available products with filtering and sorting
class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  static String path = 'shop';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<ShopCubit>();
        unawaited(cubit.loadProducts());
        return cubit;
      },
      child: const _ShopContent(),
    );
  }
}

/// Main content of shop screen
class _ShopContent extends StatelessWidget {
  const _ShopContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        return CustomScaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                _ShopHeroSection(),
                state.when(
                  initial: () => const _LoadingView(),
                  loading: () => const _LoadingView(),
                  success: (products, selectedCategory, sortBy) =>
                      _ShopProductsSection(
                        products: products,
                        selectedCategory: selectedCategory,
                        sortBy: sortBy,
                      ),
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

/// Loading view
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

/// Error view
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
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.neutral400,
            ),
            const Gap(24),
            Text(
              'Có lỗi xảy ra',
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
              text: 'Thử lại',
              onTap: () => context.read<ShopCubit>().loadProducts(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shop products section with filters
class _ShopProductsSection extends StatelessWidget {
  const _ShopProductsSection({
    required this.products,
    required this.selectedCategory,
    required this.sortBy,
  });

  final List<ProductModel> products;
  final String selectedCategory;
  final String sortBy;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1268),
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: screenSize.isDesktop
                  ? 80
                  : screenSize.isTablet
                  ? 64
                  : 48,
            ),
            child: Column(
              children: [
                _FilterSection(
                  screenSize: screenSize,
                  selectedCategory: selectedCategory,
                  sortBy: sortBy,
                  onCategoryChanged: (category) =>
                      context.read<ShopCubit>().filterByCategory(category),
                  onSortChanged: (sortBy) =>
                      context.read<ShopCubit>().sortProducts(sortBy),
                  productCount: products.length,
                ),
                Gap(screenSize.isDesktop ? 48 : 32),
                _ProductsGrid(screenSize: screenSize, products: products),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Hero section for shop page
class _ShopHeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Container(
          color: AppColors.primary.withValues(alpha: 0.05),
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
                  Text(
                    'Cửa Hàng',
                    style: GoogleFonts.lora(
                      fontSize: screenSize.isDesktop
                          ? 56
                          : screenSize.isTablet
                          ? 48
                          : 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutral800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(16),
                  Text(
                    'Khám phá đầy đủ các sản phẩm phân bón và thức ăn '
                    'chăn nuôi chất lượng cao',
                    style: GoogleFonts.inter(
                      fontSize: screenSize.isDesktop
                          ? 18
                          : screenSize.isTablet
                          ? 16
                          : 14,
                      height: 1.6,
                      color: AppColors.neutral600,
                    ),
                    textAlign: TextAlign.center,
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

/// Filter and sort section
class _FilterSection extends StatelessWidget {
  const _FilterSection({
    required this.screenSize,
    required this.selectedCategory,
    required this.sortBy,
    required this.onCategoryChanged,
    required this.onSortChanged,
    required this.productCount,
  });

  final ScreenSizes screenSize;
  final String selectedCategory;
  final String sortBy;
  final ValueChanged<String> onCategoryChanged;
  final ValueChanged<String> onSortChanged;
  final int productCount;

  @override
  Widget build(BuildContext context) {
    if (screenSize.isDesktop || screenSize.isTablet) {
      return Row(
        children: [
          Expanded(
            child: _CategoryFilters(
              selectedCategory: selectedCategory,
              onCategoryChanged: onCategoryChanged,
            ),
          ),
          const Gap(24),
          _ProductCount(count: productCount),
          const Gap(24),
          _SortDropdown(sortBy: sortBy, onSortChanged: onSortChanged),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CategoryFilters(
            selectedCategory: selectedCategory,
            onCategoryChanged: onCategoryChanged,
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ProductCount(count: productCount),
              _SortDropdown(sortBy: sortBy, onSortChanged: onSortChanged),
            ],
          ),
        ],
      );
    }
  }
}

/// Category filter buttons
class _CategoryFilters extends StatelessWidget {
  const _CategoryFilters({
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;

  static const List<String> categories = [
    'Tất cả',
    'Phân Bón',
    'Thức Ăn Chăn Nuôi',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: categories.map((category) {
        final isSelected = category == selectedCategory;
        return _CategoryChip(
          label: category,
          isSelected: isSelected,
          onTap: () => onCategoryChanged(category),
        );
      }).toList(),
    );
  }
}

/// Category filter chip
class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.neutral100,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.neutral400,
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.neutral100 : AppColors.neutral700,
            ),
          ),
        ),
      ),
    );
  }
}

/// Product count display
class _ProductCount extends StatelessWidget {
  const _ProductCount({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count sản phẩm',
      style: GoogleFonts.inter(fontSize: 14, color: AppColors.neutral600),
    );
  }
}

/// Sort dropdown
class _SortDropdown extends StatelessWidget {
  const _SortDropdown({required this.sortBy, required this.onSortChanged});

  final String sortBy;
  final ValueChanged<String> onSortChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: sortBy,
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down, color: AppColors.neutral600),
        style: GoogleFonts.inter(fontSize: 14, color: AppColors.neutral800),
        items: const [
          DropdownMenuItem(value: 'name', child: Text('Tên A-Z')),
          DropdownMenuItem(value: 'category', child: Text('Danh mục')),
        ],
        onChanged: (value) {
          if (value != null) onSortChanged(value);
        },
      ),
    );
  }
}

/// Products grid
class _ProductsGrid extends StatelessWidget {
  const _ProductsGrid({required this.screenSize, required this.products});

  final ScreenSizes screenSize;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return _EmptyState();
    }

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

/// Empty state when no products found
class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          children: [
            const Icon(
              Icons.inventory_2_outlined,
              size: 80,
              color: AppColors.neutral400,
            ),
            const Gap(16),
            Text(
              'Không tìm thấy sản phẩm',
              style: GoogleFonts.lora(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.neutral600,
              ),
            ),
            const Gap(8),
            Text(
              'Vui lòng thử lọc theo danh mục khác',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.neutral500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
