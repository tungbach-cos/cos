import 'package:tungbach/data/models/models.dart';

/// Repository interface for company information data operations.
///
/// Defines the contract for accessing company information data.
/// This allows for easy testing and different implementations
/// (mock, API, local database, etc.).
abstract interface class CompanyInfoRepository {
  /// Gets company information
  ///
  /// Returns company contact details, working hours, and other information.
  /// In a real app, this might fetch from:
  /// - Remote API: GET /api/company/info
  /// - Local database: SELECT * FROM company_info
  /// - Firebase Remote Config: company_info_config
  /// - Environment variables: COMPANY_INFO_*
  Future<CompanyInfoModel> getCompanyInfo();
}
