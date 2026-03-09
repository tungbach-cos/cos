import 'package:flutter/material.dart';

/// Model class for footer contact information
@immutable
final class FooterContactModel {
  const FooterContactModel({required this.icon, required this.text});

  final IconData icon;
  final String text;
}
