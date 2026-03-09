part of 'terms_of_service_cubit.dart';

/// State for terms of service screen
@Freezed(copyWith: false)
class TermsOfServiceState with _$TermsOfServiceState {
  const factory TermsOfServiceState.initial() = TermsOfServiceInitial;
  const factory TermsOfServiceState.loading() = TermsOfServiceLoading;
  const factory TermsOfServiceState.success({
    required TermsOfServiceModel terms,
    required CompanyInfoModel companyInfo,
  }) = TermsOfServiceSuccess;
  const factory TermsOfServiceState.failure(String error) =
      TermsOfServiceFailure;
}
