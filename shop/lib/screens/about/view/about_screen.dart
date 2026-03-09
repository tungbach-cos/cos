import 'package:flutter/material.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/screens/about/view/about_hero_section.dart';
import 'package:tungbach/screens/about/view/about_story_section.dart';
import 'package:tungbach/screens/about/view/company_values_section.dart';
import 'package:tungbach/screens/about/view/mission_vision_section.dart';

/// About Us screen displaying company information
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static String path = 'about';

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutHeroSection(),
            AboutStorySection(),
            MissionVisionSection(),
            CompanyValuesSection(),
            CtaSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
