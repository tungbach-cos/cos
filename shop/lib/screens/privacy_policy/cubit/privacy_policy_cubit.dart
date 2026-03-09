import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tungbach/data/data.dart';

part 'privacy_policy_state.dart';
part 'privacy_policy_cubit.freezed.dart';

/// Cubit for managing privacy policy state
///
/// Fetches and provides privacy policy content and company info
/// for the privacy policy screen.
/// This is a screen-specific cubit located in the screen folder.
@injectable
class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit({
    required PrivacyPolicyRepository policyRepository,
    required CompanyInfoRepository companyRepository,
  }) : _policyRepository = policyRepository,
       _companyRepository = companyRepository,
       super(const PrivacyPolicyState.initial());

  final PrivacyPolicyRepository _policyRepository;
  final CompanyInfoRepository _companyRepository;

  /// Loads privacy policy and company info from repositories
  Future<void> loadPrivacyPolicy() async {
    emit(const PrivacyPolicyState.loading());
    try {
      final results = await Future.wait([
        _policyRepository.getPrivacyPolicy(),
        _companyRepository.getCompanyInfo(),
      ]);

      if (!isClosed) {
        emit(
          PrivacyPolicyState.success(
            policy: results[0] as PrivacyPolicyModel,
            companyInfo: results[1] as CompanyInfoModel,
          ),
        );
      }
    } on Exception catch (e) {
      if (!isClosed) {
        emit(PrivacyPolicyState.failure(e.toString()));
      }
    }
  }
}
