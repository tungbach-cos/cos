part of 'company_info_cubit.dart';

/// States for company information
@Freezed(copyWith: false)
class CompanyInfoState with _$CompanyInfoState {
  /// Initial state before loading
  const factory CompanyInfoState.initial() = CompanyInfoInitial;

  /// Loading company information
  const factory CompanyInfoState.loading() = CompanyInfoLoading;

  /// Successfully loaded company information
  const factory CompanyInfoState.success(CompanyInfoModel companyInfo) =
      CompanyInfoSuccess;

  /// Failed to load company information
  const factory CompanyInfoState.failure(String error) = CompanyInfoFailure;
}
