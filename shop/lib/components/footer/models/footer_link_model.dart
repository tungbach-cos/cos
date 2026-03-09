import 'package:flutter/material.dart';

/// Model class for footer navigation links
@immutable
final class FooterLinkModel {
  const FooterLinkModel({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;
}
