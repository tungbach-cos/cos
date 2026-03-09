import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tungbach/components/components.dart';
import 'package:tungbach/components/footer/cubit/company_info_cubit.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactFormSection extends StatefulWidget {
  const ContactFormSection({super.key});

  @override
  State<ContactFormSection> createState() => _ContactFormSectionState();
}

class _ContactFormSectionState extends State<ContactFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            Labels.thankYouMessage,
            style: GoogleFonts.inter(color: AppColors.neutral100),
          ),
          backgroundColor: AppColors.primary,
        ),
      );
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize, constraints) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 1268),
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: screenSize.isDesktop
                ? 100
                : screenSize.isTablet
                ? 80
                : 60,
          ),
          child: screenSize.isDesktop || screenSize.isTablet
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: _ContactInfo(screenSize: screenSize),
                    ),
                    const Gap(60),
                    Expanded(
                      flex: 5,
                      child: _ContactForm(
                        formKey: _formKey,
                        nameController: _nameController,
                        emailController: _emailController,
                        phoneController: _phoneController,
                        messageController: _messageController,
                        onSubmit: _submitForm,
                        screenSize: screenSize,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _ContactInfo(screenSize: screenSize),
                    const Gap(40),
                    _ContactForm(
                      formKey: _formKey,
                      nameController: _nameController,
                      emailController: _emailController,
                      phoneController: _phoneController,
                      messageController: _messageController,
                      onSubmit: _submitForm,
                      screenSize: screenSize,
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo({required this.screenSize});

  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyInfoCubit, CompanyInfoState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (info) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Labels.contactWithUs,
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
                ),
                const Gap(24),
                Text(
                  Labels.contactDescription,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    height: 1.6,
                    color: AppColors.neutral600,
                  ),
                ),
                const Gap(40),
                _ContactInfoItem(
                  icon: Icons.location_on_outlined,
                  title: Labels.address,
                  content: Labels.viewOnGoogleMaps,
                  isClickable: true,
                  onTap: () => launchUrlString(info.mapUrl),
                ),
                const Gap(24),
                _ContactInfoItem(
                  icon: Icons.phone_outlined,
                  title: Labels.phone,
                  content: info.phoneNumbers.first,
                  isClickable: true,
                  onTap: () =>
                      launchUrlString('tel:${info.phoneNumbers.first}'),
                ),
                if (info.phoneNumbers.length > 1) ...[
                  const Gap(16),
                  _ContactInfoItem(
                    icon: Icons.phone_outlined,
                    title: Labels.phone,
                    content: info.phoneNumbers[1],
                    isClickable: true,
                    onTap: () => launchUrlString('tel:${info.phoneNumbers[1]}'),
                  ),
                ],
                const Gap(24),
                _ContactInfoItem(
                  icon: Icons.email_outlined,
                  title: Labels.email,
                  content: info.email,
                  isClickable: true,
                  onTap: () => launchUrlString('mailto:${info.email}'),
                ),
                const Gap(24),
                _ContactInfoItem(
                  icon: Icons.access_time_outlined,
                  title: Labels.workingHours,
                  content: info.workingHours,
                ),
              ],
            );
          },
          orElse: () => const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(Labels.loadingContactInfo)],
          ),
        );
      },
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.content,
    this.isClickable = false,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String content;
  final bool isClickable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title.isNotEmpty) ...[
                Text(
                  title,
                  style: GoogleFonts.lora(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutral800,
                  ),
                ),
                const Gap(4),
              ],
              Text(
                content,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1.5,
                  color: isClickable ? AppColors.primary : AppColors.neutral600,
                  decoration: isClickable
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (isClickable && onTap != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(onTap: onTap, child: child),
      );
    }

    return child;
  }
}

class _ContactForm extends StatelessWidget {
  const _ContactForm({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.messageController,
    required this.onSubmit,
    required this.screenSize,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController messageController;
  final VoidCallback onSubmit;
  final ScreenSizes screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.neutral200,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neutral400),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              Labels.sendMessage,
              style: GoogleFonts.lora(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.neutral800,
              ),
            ),
            const Gap(24),
            _FormField(
              controller: nameController,
              label: Labels.fullName,
              hint: Labels.enterFullName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return Labels.enterFullNameError;
                }
                return null;
              },
            ),
            const Gap(20),
            _FormField(
              controller: emailController,
              label: Labels.emailAddress,
              hint: 'example@email.com (tùy chọn)',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value != null && value.isNotEmpty && !value.contains('@')) {
                  return Labels.invalidEmailError;
                }
                return null;
              },
            ),
            const Gap(20),
            _FormField(
              controller: phoneController,
              label: Labels.phoneNumber,
              hint: '0xxx xxx xxx',
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return Labels.enterPhoneError;
                }
                return null;
              },
            ),
            const Gap(20),
            _FormField(
              controller: messageController,
              label: Labels.message,
              hint: Labels.enterMessage,
              maxLines: 6,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return Labels.enterMessageError;
                }
                return null;
              },
            ),
            const Gap(32),
            Button(
              text: Labels.sendMessage,
              buttonType: .filled,
              buttonSize: .large,
              onTap: onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.neutral800,
          ),
        ),
        const Gap(8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: GoogleFonts.inter(fontSize: 16, color: AppColors.neutral800),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              fontSize: 16,
              color: AppColors.neutral500,
            ),
            filled: true,
            fillColor: AppColors.neutral100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.neutral400),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.neutral400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
