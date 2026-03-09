import 'package:injectable/injectable.dart';
import 'package:tungbach/data/models/privacy_policy_model.dart';
import 'package:tungbach/data/models/terms_of_service_model.dart';
import 'package:tungbach/data/repositories/terms_of_service/terms_of_service_repository.dart';

/// Implementation of terms of service repository
///
/// Provides terms of service content. Currently returns static data,
/// but can be easily extended to fetch from CMS or API.
/// This follows the repository pattern from the data layer architecture.
@Injectable(
  as: TermsOfServiceRepository,
) // ← Registers interface with implementation
final class TermsOfServiceRepositoryImpl implements TermsOfServiceRepository {
  /// Creates a terms of service repository implementation
  TermsOfServiceRepositoryImpl();

  /// Get terms of service content
  ///
  /// In a real app, this might fetch from:
  /// - CMS (Content Management System)
  /// - Remote API
  /// - Local database
  /// - Static files
  @override
  Future<TermsOfServiceModel> getTermsOfService() async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 100));

    return TermsOfServiceModel(
      pageTitle: 'Điều Khoản Sử Dụng',
      lastUpdated: DateTime.now(),
      sections: [
        const PolicySectionModel(
          title: '1. Chấp Nhận Điều Khoản',
          content:
              'Bằng việc truy cập và sử dụng dịch vụ của Nông Sản '
              'Tùng Bách, bạn đồng ý tuân theo và bị ràng buộc bởi '
              'các điều khoản và điều kiện sau đây. Nếu bạn không đồng '
              'ý với bất kỳ phần nào của các điều khoản này, vui lòng '
              'không sử dụng dịch vụ của chúng tôi.',
        ),
        const PolicySectionModel(
          title: '2. Dịch Vụ',
          content:
              'Nông Sản Tùng Bách cung cấp các dịch vụ sau:\n\n'
              '• Phân phối phân bón và cám chất lượng cao\n'
              '• Thu mua nông sản từ người nông dân\n'
              '• Tư vấn kỹ thuật về canh tác và chăn nuôi\n'
              '• Cung cấp thông tin và hỗ trợ khách hàng\n\n'
              'Chúng tôi có quyền thay đổi, tạm ngưng, hoặc chấm dứt '
              'bất kỳ dịch vụ nào mà không cần thông báo trước.',
        ),
        const PolicySectionModel(
          title: '3. Đặt Hàng và Thanh Toán',
          content:
              'Khi đặt hàng, bạn đồng ý:\n\n'
              '• Cung cấp thông tin chính xác và đầy đủ\n'
              '• Thanh toán đầy đủ theo phương thức đã thỏa thuận\n'
              '• Nhận hàng đúng thời gian đã hẹn\n'
              '• Kiểm tra hàng hóa khi nhận và báo ngay nếu có '
              'vấn đề\n\n'
              'Chúng tôi có quyền từ chối hoặc hủy đơn hàng nếu '
              'phát hiện thông tin không chính xác hoặc gian lận.',
        ),
        const PolicySectionModel(
          title: '4. Giá Cả và Khuyến Mãi',
          content:
              'Giá cả sản phẩm có thể thay đổi theo thời gian và '
              'thị trường. Giá áp dụng là giá tại thời điểm xác nhận '
              'đơn hàng.\n\n'
              'Các chương trình khuyến mãi có thời hạn giới hạn và '
              'điều kiện áp dụng cụ thể. Chúng tôi có quyền thay đổi '
              'hoặc kết thúc chương trình khuyến mãi bất cứ lúc nào.',
        ),
        const PolicySectionModel(
          title: '5. Giao Hàng',
          content:
              'Thời gian giao hàng phụ thuộc vào:\n\n'
              '• Địa điểm giao hàng\n'
              '• Tình trạng kho hàng\n'
              '• Điều kiện thời tiết và giao thông\n\n'
              'Chúng tôi sẽ cố gắng giao hàng đúng hẹn nhưng không '
              'chịu trách nhiệm cho các trường hợp chậm trễ ngoài tầm '
              'kiểm soát (thiên tai, dịch bệnh, v.v.).',
        ),
        const PolicySectionModel(
          title: '6. Đổi Trả và Hoàn Tiền',
          content:
              'Chính sách đổi trả:\n\n'
              '• Sản phẩm lỗi hoặc không đúng mô tả: '
              'Đổi trả trong vòng 7 ngày\n'
              '• Sản phẩm còn nguyên tem, mác, bao bì\n'
              '• Có hóa đơn mua hàng hợp lệ\n'
              '• Phân bón và cám đã mở không được đổi trả '
              '(trừ lỗi sản xuất)\n\n'
              'Thời gian hoàn tiền: 7-14 ngày làm việc sau khi '
              'xác nhận đổi trả.',
        ),
        const PolicySectionModel(
          title: '7. Bảo Hành và Cam Kết Chất Lượng',
          content:
              'Chúng tôi cam kết:\n\n'
              '• Sản phẩm chính hãng, nguồn gốc rõ ràng\n'
              '• Chất lượng đúng như mô tả\n'
              '• Hỗ trợ kỹ thuật sau bán hàng\n\n'
              'Tuy nhiên, chúng tôi không chịu trách nhiệm cho:\n\n'
              '• Thiệt hại do sử dụng sai hướng dẫn\n'
              '• Kết quả canh tác phụ thuộc vào nhiều yếu tố '
              'khách quan\n'
              '• Sản phẩm đã quá hạn sử dụng',
        ),
        const PolicySectionModel(
          title: '8. Trách Nhiệm Người Dùng',
          content:
              'Khi sử dụng dịch vụ, bạn đồng ý:\n\n'
              '• Không sử dụng dịch vụ cho mục đích bất hợp pháp\n'
              '• Không cung cấp thông tin sai lệch\n'
              '• Không làm ảnh hưởng đến hoạt động của hệ thống\n'
              '• Tuân thủ mọi quy định pháp luật hiện hành\n'
              '• Tôn trọng quyền sở hữu trí tuệ của chúng tôi',
        ),
        const PolicySectionModel(
          title: '9. Giới Hạn Trách Nhiệm',
          content:
              'Nông Sản Tùng Bách không chịu trách nhiệm cho:\n\n'
              '• Thiệt hại gián tiếp, ngẫu nhiên, hoặc hậu quả\n'
              '• Mất mát dữ liệu hoặc thông tin\n'
              '• Gián đoạn dịch vụ do sự cố kỹ thuật\n'
              '• Hành động của bên thứ ba (vận chuyển, thanh toán)\n\n'
              'Trách nhiệm tối đa của chúng tôi giới hạn ở giá trị '
              'đơn hàng.',
        ),
        const PolicySectionModel(
          title: '10. Quyền Sở Hữu Trí Tuệ',
          content:
              'Tất cả nội dung trên website bao gồm văn bản, hình '
              'ảnh, logo, thiết kế là tài sản của Nông Sản Tùng Bách '
              'và được bảo vệ bởi luật sở hữu trí tuệ. Nghiêm cấm sao '
              'chép, phân phối, hoặc sử dụng mà không có sự cho phép '
              'bằng văn bản.',
        ),
        const PolicySectionModel(
          title: '11. Thay Đổi Điều Khoản',
          content:
              'Chúng tôi có quyền cập nhật và thay đổi điều khoản '
              'sử dụng này bất cứ lúc nào. Các thay đổi có hiệu lực '
              'ngay sau khi đăng tải trên website. Việc bạn tiếp tục '
              'sử dụng dịch vụ sau khi có thay đổi đồng nghĩa với việc '
              'bạn chấp nhận các điều khoản mới.',
        ),
        const PolicySectionModel(
          title: '12. Luật Áp Dụng',
          content:
              'Các điều khoản này được điều chỉnh bởi luật pháp '
              'Việt Nam. Mọi tranh chấp phát sinh sẽ được giải quyết '
              'thông qua thương lượng, hòa giải, hoặc tại Tòa án có '
              'thẩm quyền tại Việt Nam.',
        ),
        const PolicySectionModel(
          title: '13. Liên Hệ',
          content:
              'Nếu bạn có câu hỏi về điều khoản sử dụng này, '
              'vui lòng liên hệ với chúng tôi để được hỗ trợ.',
        ),
      ],
    );
  }
}
