import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tungbach/data/data.dart';

part 'terms_of_service_state.dart';
part 'terms_of_service_cubit.freezed.dart';

/// Cubit for managing terms of service state
@injectable
class TermsOfServiceCubit extends Cubit<TermsOfServiceState> {
  TermsOfServiceCubit({
    required TermsOfServiceRepository termsRepository,
    required CompanyInfoRepository companyRepository,
  }) : _termsRepository = termsRepository,
       _companyRepository = companyRepository,
       super(const TermsOfServiceState.initial());

  final TermsOfServiceRepository _termsRepository;
  final CompanyInfoRepository _companyRepository;

  /// Load terms of service content and company info
  Future<void> loadTermsOfService() async {
    emit(const TermsOfServiceState.loading());
    try {
      final results = await Future.wait([
        _termsRepository.getTermsOfService(),
        _companyRepository.getCompanyInfo(),
      ]);

      if (!isClosed) {
        emit(
          TermsOfServiceState.success(
            terms: results[0] as TermsOfServiceModel,
            companyInfo: results[1] as CompanyInfoModel,
          ),
        );
      }
    } on Exception catch (e) {
      if (!isClosed) {
        emit(TermsOfServiceState.failure(e.toString()));
      }
    }
  }
}
