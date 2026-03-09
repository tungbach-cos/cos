import 'package:tungbach/data/models/terms_of_service_model.dart';

/// Repository interface for terms of service data operations.
///
/// Defines the contract for accessing terms of service data.
/// This allows for easy testing and different implementations
/// (mock, API, CMS, etc.).
abstract interface class TermsOfServiceRepository {
  /// Get terms of service content
  ///
  /// Returns the complete terms of service with all sections.
  /// In a real app, this might fetch from:
  /// - CMS (Content Management System): GET /api/cms/terms
  /// - Remote API: GET /api/legal/terms-of-service
  /// - Local database: SELECT * FROM terms_of_service
  /// - Static files: /assets/legal/terms_of_service.json
  Future<TermsOfServiceModel> getTermsOfService();
}
