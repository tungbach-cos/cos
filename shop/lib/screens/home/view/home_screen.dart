import 'package:flutter/material.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/screens/home/view/hero_section.dart';
import 'package:tungbach/screens/home/view/products_section.dart';
import 'package:tungbach/screens/home/view/services_section.dart';
import 'package:tungbach/screens/home/view/why_choose_us_section.dart';

/// Home screen displaying main landing page
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String path = 'home';

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            ServicesSection(),
            ProductsSection(),
            WhyChooseUsSection(),
            CtaSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
