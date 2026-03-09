import 'package:tungbach/screens/screens.dart';

/// Navigation link model for presentation layer
class NavigationLink {
  const NavigationLink({required this.title, required this.route});

  final String title;
  final String route;
}

/// Main navigation links for Header
final mainNavigationLinks = [
  NavigationLink(title: 'Trang chủ', route: '/${HomeScreen.path}'),
  NavigationLink(title: 'Cửa hàng', route: '/${ShopScreen.path}'),
  NavigationLink(title: 'Dịch vụ', route: '/${ServicesScreen.path}'),
  NavigationLink(title: 'Về chúng tôi', route: '/${AboutScreen.path}'),
];

/// Quick links for Footer
final quickLinks = [
  NavigationLink(title: 'Trang chủ', route: '/${HomeScreen.path}'),
  NavigationLink(title: 'Về chúng tôi', route: '/${AboutScreen.path}'),
  NavigationLink(title: 'Dịch vụ', route: '/${ServicesScreen.path}'),
  NavigationLink(title: 'Cửa hàng', route: '/${ShopScreen.path}'),
  NavigationLink(title: 'Liên hệ', route: '/${ContactScreen.path}'),
];

/// Service links for Footer
final _serviceLinksTitles = [
  'Phân Bón Chất Lượng',
  'Cám & Thức Ăn',
  'Thu Mua Nông Sản',
  'Tư Vấn Kỹ Thuật',
];

final List<NavigationLink> serviceLinks = List.generate(
  _serviceLinksTitles.length,
  (index) => NavigationLink(
    title: _serviceLinksTitles[index],
    route: '/${ServicesScreen.path}',
  ),
);
