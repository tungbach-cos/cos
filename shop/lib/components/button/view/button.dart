import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/resources/resources.dart';

class Button extends StatefulWidget {
  const Button({
    required this.text,
    super.key,
    this.onTap,
    this.buttonSize = .small,
    this.buttonType = .primary,
    this.isDarkBackground = false,
    this.customColors,
  });

  final String text;
  final VoidCallback? onTap;
  final ButtonSizes buttonSize;
  final ButtonTypes buttonType;
  final bool isDarkBackground;
  final ButtonColors? customColors;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  TextStyle get _textStyle {
    final fontWeight = switch (widget.buttonType) {
      .primary => FontWeight.w400,
      .secondary => FontWeight.w500,
      .filled => FontWeight.w500,
      .outlined => FontWeight.w500,
    };
    const height = 1.1;
    final style = GoogleFonts.inter();
    return switch (widget.buttonSize) {
      .small => style.copyWith(
        fontSize: 16,
        height: height,
        fontWeight: fontWeight,
      ),
      .normal => style.copyWith(
        fontSize: 18,
        height: height,
        fontWeight: fontWeight,
      ),
      .large => style.copyWith(
        fontSize: 22,
        height: height,
        fontWeight: fontWeight,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return TextButton(
          onPressed: widget.onTap,
          style: ButtonStyle(
            padding: const WidgetStatePropertyAll(EdgeInsets.zero),
            backgroundColor: WidgetStateColor.resolveWith((states) {
              final isHover = states.firstOrNull == WidgetState.hovered;
              if (widget.customColors != null) {
                return isHover
                    ? (widget.customColors!.hoverBgColor ??
                          AppColors.transparent)
                    : (widget.customColors!.bgColor ?? AppColors.transparent);
              }
              if (isHover) {
                return switch (widget.buttonType) {
                  .primary => AppColors.transparent,
                  .secondary => AppColors.neutral800,
                  .filled => AppColors.neutral800,
                  .outlined => AppColors.primary,
                };
              }
              return switch (widget.buttonType) {
                .primary => AppColors.primary,
                .secondary => AppColors.transparent,
                .filled => AppColors.primary,
                .outlined => AppColors.transparent,
              };
            }),
            overlayColor: const WidgetStatePropertyAll(AppColors.transparent),
            foregroundColor: WidgetStateColor.resolveWith((states) {
              final isHover = states.firstOrNull == WidgetState.hovered;
              if (widget.customColors != null) {
                return isHover
                    ? (widget.customColors!.hoverTextColor ??
                          AppColors.neutral800)
                    : (widget.customColors!.textColor ?? AppColors.neutral800);
              }
              if (isHover) {
                return switch (widget.buttonType) {
                  .primary => AppColors.neutral800,
                  .secondary => AppColors.neutral100,
                  .filled => AppColors.neutral100,
                  .outlined => AppColors.neutral100,
                };
              }
              return switch (widget.buttonType) {
                .primary => AppColors.neutral100,
                .secondary => AppColors.neutral800,
                .filled => AppColors.neutral100,
                .outlined => AppColors.primary,
              };
            }),
            textStyle: WidgetStatePropertyAll(_textStyle),
            shape: WidgetStateProperty.resolveWith((states) {
              final isHover = states.firstOrNull == WidgetState.hovered;
              if (widget.customColors != null) {
                final borderColor = isHover
                    ? (widget.customColors!.hoverBorderColor ??
                          widget.customColors!.borderColor ??
                          AppColors.neutral800)
                    : (widget.customColors!.borderColor ??
                          AppColors.neutral800);
                return RoundedRectangleBorder(
                  side: BorderSide(color: borderColor),
                );
              }
              final borderSide = BorderSide(
                color: !widget.isDarkBackground
                    ? AppColors.neutral800
                    : AppColors.neutral100,
              );
              final shouldShowBorder = switch (widget.buttonType) {
                .primary => isHover,
                .secondary => true,
                .filled => false,
                .outlined => true,
              };
              return RoundedRectangleBorder(
                side: shouldShowBorder ? borderSide : BorderSide.none,
              );
            }),
          ),
          child: _ResponsivePadding(
            type: widget.buttonType,
            size: widget.buttonSize,
            child: Text(widget.text),
          ),
        );
      },
    );
  }
}

class _ResponsivePadding extends StatelessWidget {
  const _ResponsivePadding({
    required this.child,
    required this.size,
    required this.type,
  });

  final Widget child;
  final ButtonSizes size;
  final ButtonTypes type;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        late final EdgeInsets padding;
        final isPrimary = type == .primary;
        padding = switch (size) {
          .small => EdgeInsets.symmetric(
            horizontal: isPrimary ? 24 : 32,
            vertical: 14,
          ),
          .normal => EdgeInsets.symmetric(
            horizontal: screenSize.isDesktop ? 46 : 35,
            vertical: screenSize.isDesktop
                ? 26
                : screenSize.isTablet
                ? 22
                : 20,
          ),
          .large => EdgeInsets.symmetric(
            horizontal: 68,
            vertical: screenSize.isDesktop ? 26 : 28,
          ),
        };
        return Padding(padding: padding, child: child);
      },
    );
  }
}
