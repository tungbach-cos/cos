import 'package:injectable/injectable.dart';
import 'package:tungbach/data/models/models.dart';
import 'package:tungbach/data/repositories/company_info/company_info_repository.dart';

/// Implementation of company information repository
///
/// Provides company contact details and information.
/// This follows the repository pattern from the data layer architecture.
@Injectable(
  as: CompanyInfoRepository,
) // ← Registers interface with implementation
final class CompanyInfoRepositoryImpl implements CompanyInfoRepository {
  /// Creates a company info repository implementation
  CompanyInfoRepositoryImpl();

  /// Gets company information
  ///
  /// In a real app, this might fetch from:
  /// - Remote API: GET /api/company/info
  /// - Local database: SELECT * FROM company_info
  /// - Firebase Remote Config: company_info_config
  /// - Environment variables: COMPANY_INFO_*
  @override
  Future<CompanyInfoModel> getCompanyInfo() async {
    // Simulate network delay for realistic behavior
    await Future<void>.delayed(const Duration(milliseconds: 100));

    // In production, this would make actual API calls:
    // final response = await httpClient.get('/api/company/info');
    // return CompanyInfoModel.fromJson(response.data);

    return const CompanyInfoModel(
      companyName: 'Nông Sản Tùng Bách',
      email: 'phamthanhtung1995@gmail.com',
      phoneNumbers: ['0975271968', '0914099498'],
      mapUrl: 'https://maps.app.goo.gl/mzYRhoWbFydc2h7X6',
      workingHours: 'Thứ 2 - Chủ Nhật: 7:00 - 18:00',
      description:
          'Địa chỉ tin cậy cho bà con nông dân. '
          'Chuyên cung cấp phân bón, cám chất lượng cao và '
          'thu mua nông sản với giá tốt nhất.',
    );
  }
}
