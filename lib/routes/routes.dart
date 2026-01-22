import 'package:get/get.dart';
import 'package:test_project/features/splash_view/presentation/screen/splash_screen.dart';

import '../features/aut_view/presentation/screen/login_screen.dart';
import '../features/onboarding_view/presentation/screen/onboarding_screen.dart';

class AppRoutes {
  static String instal = '/splash_screen';
  static String onboarding = '/onboarding_screen';
  static String login = '/login_screen';

  static final List<GetPage> pages = [
    GetPage(name: instal, page: () => SplashScreen()),
    GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(name: login, page: () => LoginScreen()),
  ];
}
