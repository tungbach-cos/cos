import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tungbach/data/data.dart';

part 'company_info_state.dart';
part 'company_info_cubit.freezed.dart';

/// Cubit for managing company information state
///
/// Fetches and provides company contact details for footer component.
/// Follows the Cubit pattern for simple state management without events.
@injectable
class CompanyInfoCubit extends Cubit<CompanyInfoState> {
  CompanyInfoCubit({
    required CompanyInfoRepository repository,
  }) : _repository = repository,
       super(const CompanyInfoState.initial());

  final CompanyInfoRepository _repository;

  /// Loads company information from repository
  Future<void> loadCompanyInfo() async {
    emit(const CompanyInfoState.loading());
    try {
      final companyInfo = await _repository.getCompanyInfo();
      if (!isClosed) {
        emit(CompanyInfoState.success(companyInfo));
      }
    } on Exception catch (e) {
      if (!isClosed) {
        emit(CompanyInfoState.failure(e.toString()));
      }
    }
  }
}
