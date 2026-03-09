import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Model representing company contact information
@immutable
final class CompanyInfoModel extends Equatable {
  const CompanyInfoModel({
    required this.companyName,
    required this.email,
    required this.phoneNumbers,
    required this.mapUrl,
    required this.workingHours,
    required this.description,
  });

  final String companyName;
  final String email;
  final List<String> phoneNumbers;
  final String mapUrl;
  final String workingHours;
  final String description;

  @override
  List<Object?> get props => [
    companyName,
    email,
    phoneNumbers,
    mapUrl,
    workingHours,
    description,
  ];
}
