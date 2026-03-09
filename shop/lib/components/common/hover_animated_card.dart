import 'dart:async';

import 'package:flutter/material.dart';

/// Reusable widget that provides hover animation effects for card widgets.
///
/// This widget wraps a child widget and provides:
/// - Scale animation on hover (1.0 to 1.05)
/// - Elevation animation on hover (0 to 8px)
/// - Smooth transitions with ease-in-out curve
///
/// Usage:
/// ```dart
/// HoverAnimatedCard(
///   child: Container(
///     padding: EdgeInsets.all(20),
///     child: Text('Hover me!'),
///   ),
/// )
/// ```
class HoverAnimatedCard extends StatefulWidget {
  const HoverAnimatedCard({
    required this.child,
    super.key,
    this.onTap,
  });

  /// The widget to animate
  final Widget child;

  /// Optional tap callback for the entire card
  final VoidCallback? onTap;

  @override
  State<HoverAnimatedCard> createState() => _HoverAnimatedCardState();
}

class _HoverAnimatedCardState extends State<HoverAnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation =
        Tween<double>(
          begin: 1,
          end: 1.05,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHoverEnter() {
    unawaited(_animationController.forward());
  }

  void _onHoverExit() {
    unawaited(_animationController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHoverEnter(),
      onExit: (_) => _onHoverExit(),
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}
