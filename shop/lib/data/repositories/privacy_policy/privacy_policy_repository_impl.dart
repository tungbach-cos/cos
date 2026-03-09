import 'package:injectable/injectable.dart';
import 'package:tungbach/data/models/privacy_policy_model.dart';
import 'package:tungbach/data/repositories/privacy_policy/privacy_policy_repository.dart';

/// Implementation of privacy policy repository
///
/// Provides privacy policy content. Currently returns static data,
/// but can be easily extended to fetch from CMS or API.
@Injectable(
  as: PrivacyPolicyRepository,
) // ← Registers interface with implementation
final class PrivacyPolicyRepositoryImpl implements PrivacyPolicyRepository {
  /// Creates a privacy policy repository implementation
  PrivacyPolicyRepositoryImpl();

  /// Get privacy policy content
  @override
  Future<PrivacyPolicyModel> getPrivacyPolicy() async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 100));

    return PrivacyPolicyModel(
      pageTitle: 'Chính Sách Bảo Mật',
      lastUpdated: DateTime.now(),
      sections: [
        const PolicySectionModel(
          title: '1. Giới Thiệu',
          content:
              'Nông Sản Tùng Bách cam kết bảo vệ quyền riêng tư '
              'của khách hàng. Chính sách bảo mật này giải thích '
              'cách chúng tôi thu thập, sử dụng, và bảo vệ thông tin '
              'cá nhân của bạn khi bạn sử dụng dịch vụ của chúng tôi.',
        ),
        const PolicySectionModel(
          title: '2. Thông Tin Chúng Tôi Thu Thập',
          content:
              'Chúng tôi có thể thu thập các thông tin sau:\n\n'
              '• Thông tin cá nhân: Tên, địa chỉ, số điện thoại, '
              'địa chỉ email\n'
              '• Thông tin giao dịch: Lịch sử mua hàng, đơn đặt hàng\n'
              '• Thông tin kỹ thuật: Địa chỉ IP, loại trình duyệt, '
              'thiết bị truy cập\n'
              '• Thông tin sử dụng: Cách bạn tương tác với website và '
              'dịch vụ của chúng tôi',
        ),
        const PolicySectionModel(
          title: '3. Cách Chúng Tôi Sử Dụng Thông Tin',
          content:
              'Thông tin được thu thập sẽ được sử dụng để:\n\n'
              '• Xử lý đơn hàng và cung cấp dịch vụ\n'
              '• Liên lạc với khách hàng về đơn hàng và dịch vụ\n'
              '• Cải thiện sản phẩm và dịch vụ của chúng tôi\n'
              '• Gửi thông tin khuyến mãi (nếu bạn đồng ý nhận)\n'
              '• Tuân thủ các yêu cầu pháp lý',
        ),
        const PolicySectionModel(
          title: '4. Bảo Mật Thông Tin',
          content:
              'Chúng tôi áp dụng các biện pháp bảo mật kỹ thuật '
              'và tổ chức phù hợp để bảo vệ thông tin cá nhân của bạn '
              'khỏi truy cập, sử dụng, hoặc tiết lộ trái phép. '
              'Tuy nhiên, không có phương thức truyền tải qua Internet '
              'hoặc phương thức lưu trữ điện tử nào là an toàn '
              'tuyệt đối.',
        ),
        const PolicySectionModel(
          title: '5. Chia Sẻ Thông Tin',
          content:
              'Chúng tôi không bán hoặc cho thuê thông tin cá nhân của '
              'bạn cho bên thứ ba. '
              'Thông tin có thể được chia sẻ với:\n\n'
              '• Đối tác vận chuyển để giao hàng\n'
              '• Nhà cung cấp dịch vụ thanh toán để xử lý giao dịch\n'
              '• Cơ quan chức năng khi có yêu cầu pháp lý',
        ),
        const PolicySectionModel(
          title: '6. Quyền Của Bạn',
          content:
              'Bạn có quyền:\n\n'
              '• Truy cập và xem thông tin cá nhân của mình\n'
              '• Yêu cầu chỉnh sửa hoặc cập nhật thông tin\n'
              '• Yêu cầu xóa thông tin cá nhân '
              '(trong một số trường hợp)\n'
              '• Từ chối nhận thông tin tiếp thị\n'
              '• Khiếu nại về cách chúng tôi xử lý thông tin của bạn',
        ),
        const PolicySectionModel(
          title: '7. Cookies',
          content:
              'Website của chúng tôi sử dụng cookies để cải thiện trải '
              'nghiệm người dùng. Cookies là các tệp văn bản nhỏ được '
              'lưu trữ trên thiết bị của bạn. Bạn có thể tắt cookies '
              'trong cài đặt trình duyệt, nhưng điều này có thể ảnh '
              'hưởng đến chức năng của website.',
        ),
        const PolicySectionModel(
          title: '8. Thay Đổi Chính Sách',
          content:
              'Chúng tôi có thể cập nhật chính sách bảo mật này '
              'theo thời gian. Mọi thay đổi sẽ được đăng tải trên '
              'trang này với ngày cập nhật mới. Chúng tôi khuyến '
              'khích bạn xem lại chính sách này định kỳ.',
        ),
      ],
    );
  }
}
