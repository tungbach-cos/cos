import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_policy_model.freezed.dart';

/// Model for privacy policy section
@freezed
abstract class PolicySectionModel with _$PolicySectionModel {
  const factory PolicySectionModel({
    required String title,
    required String content,
  }) = _PolicySectionModel;
}

/// Model for complete privacy policy document
@freezed
abstract class PrivacyPolicyModel with _$PrivacyPolicyModel {
  const factory PrivacyPolicyModel({
    required String pageTitle,
    required DateTime lastUpdated,
    required List<PolicySectionModel> sections,
  }) = _PrivacyPolicyModel;
}
