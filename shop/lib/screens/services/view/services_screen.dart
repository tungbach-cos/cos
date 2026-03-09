import 'package:flutter/material.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/screens/services/view/service_benefits_section.dart';
import 'package:tungbach/screens/services/view/service_details_section.dart';
import 'package:tungbach/screens/services/view/services_hero_section.dart';

/// Services screen displaying all service offerings
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  static String path = 'services';

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ServicesHeroSection(),
            ServiceDetailsSection(),
            ServiceBenefitsSection(),
            CtaSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
