import 'package:tungbach/data/models/privacy_policy_model.dart';

/// Repository interface for privacy policy data operations.
///
/// Defines the contract for accessing privacy policy data.
/// This allows for easy testing and different implementations
/// (mock, API, CMS, etc.).
abstract interface class PrivacyPolicyRepository {
  /// Get privacy policy content
  ///
  /// Returns the complete privacy policy with all sections.
  /// In a real app, this might fetch from:
  /// - CMS (Content Management System): GET /api/cms/privacy
  /// - Remote API: GET /api/legal/privacy-policy
  /// - Local database: SELECT * FROM privacy_policy
  /// - Static files: /assets/legal/privacy_policy.json
  Future<PrivacyPolicyModel> getPrivacyPolicy();
}
