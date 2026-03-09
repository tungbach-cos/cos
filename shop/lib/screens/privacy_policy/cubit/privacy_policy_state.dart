part of 'privacy_policy_cubit.dart';

/// States for privacy policy data
@Freezed(copyWith: false)
class PrivacyPolicyState with _$PrivacyPolicyState {
  /// Initial state before loading
  const factory PrivacyPolicyState.initial() = PrivacyPolicyInitial;

  /// Loading privacy policy data
  const factory PrivacyPolicyState.loading() = PrivacyPolicyLoading;

  /// Successfully loaded privacy policy data
  const factory PrivacyPolicyState.success({
    required PrivacyPolicyModel policy,
    required CompanyInfoModel companyInfo,
  }) = PrivacyPolicySuccess;

  /// Failed to load privacy policy data
  const factory PrivacyPolicyState.failure(String error) = PrivacyPolicyFailure;
}
