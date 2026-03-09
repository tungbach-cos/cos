import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tungbach/data/models/privacy_policy_model.dart';

part 'terms_of_service_model.freezed.dart';

/// Model for complete terms of service document
@freezed
abstract class TermsOfServiceModel with _$TermsOfServiceModel {
  const factory TermsOfServiceModel({
    required String pageTitle,
    required DateTime lastUpdated,
    required List<PolicySectionModel> sections,
  }) = _TermsOfServiceModel;
}
