import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tungbach/resources/resources.dart';
import 'package:tungbach/screens/screens.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: SplashScreen.path,
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: HomeScreen.path,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: AboutScreen.path,
          builder: (context, state) => const AboutScreen(),
        ),
        GoRoute(
          path: ServicesScreen.path,
          builder: (context, state) => const ServicesScreen(),
        ),
        GoRoute(
          path: ContactScreen.path,
          builder: (context, state) => const ContactScreen(),
        ),
        GoRoute(
          path: ShopScreen.path,
          builder: (context, state) => const ShopScreen(),
        ),
        GoRoute(
          path: '${ProductDetailScreen.path}/:productId',
          builder: (context, state) {
            final productId = state.pathParameters['productId'] ?? '';
            return ProductDetailScreen(productId: productId);
          },
        ),
        GoRoute(
          path: PrivacyPolicyScreen.path,
          builder: (context, state) => const PrivacyPolicyScreen(),
        ),
        GoRoute(
          path: TermsOfServiceScreen.path,
          builder: (context, state) => const TermsOfServiceScreen(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    return const NotFoundScreen();
  },
);

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Nông sản Tùng Bách',
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: true,
        overscroll: true,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          surface: AppColors.neutral100,
        ),
        scaffoldBackgroundColor: AppColors.neutral100,
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeForwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeForwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeForwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeForwardsPageTransitionsBuilder(),
          },
        ),
      ),
      builder: (context, child) {
        return ResponsiveBreakpoints(
          breakpoints: const [
            Breakpoint(start: 0, end: 479, name: MOBILE),
            Breakpoint(start: 480, end: 767, name: PHONE),
            Breakpoint(start: 768, end: 991, name: TABLET),
            Breakpoint(start: 992, end: double.infinity, name: DESKTOP),
          ],
          child: child!,
        );
      },
    );
  }
}
