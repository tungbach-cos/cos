import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/components/footer/cubit/company_info_cubit.dart';
import 'package:tungbach/injection.dart';
import 'package:tungbach/screens/contact/view/contact_form_section.dart';
import 'package:tungbach/screens/contact/view/contact_hero_section.dart';

/// Contact screen displaying company information
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static String path = 'contact';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<CompanyInfoCubit>();
        unawaited(cubit.loadCompanyInfo());
        return cubit;
      },
      child: const CustomScaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ContactHeroSection(),
              ContactFormSection(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
