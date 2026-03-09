import 'package:flutter/material.dart';
import 'package:tungbach/components/header/view/header.dart';

/// Custom scaffold that automatically includes the mobile navigation drawer
/// and header.
///
/// This scaffold wraps the standard [Scaffold] and automatically adds:
/// - The end drawer with mobile navigation
/// - The Header component at the top of the body
///
/// Screens only need to provide their content without including Header.
///
/// Example:
/// ```dart
/// CustomScaffold(
///   body: SingleChildScrollView(
///     child: Column(
///       children: [
///         HeroSection(),
///         ServicesSection(),
///         // Your content (Header is automatically included)
///       ],
///     ),
///   ),
/// )
/// ```
class CustomScaffold extends StatelessWidget {
  /// Creates a custom scaffold with automatic drawer and header support.
  const CustomScaffold({
    required this.body,
    super.key,
  });

  /// The main content of the scaffold (Header is automatically added at
  /// the top).
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Header.buildDrawer(context),
      body: Column(
        children: [
          const Header(),
          Expanded(child: body),
        ],
      ),
    );
  }
}
