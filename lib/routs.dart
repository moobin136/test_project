import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_project/fetureas/home_view/presentation/screen/home_view.dart';

import 'fetureas/onbord_view/presentation/screen/onboard_view.dart';

class AppRouts {
  static const String instal = '/instal';
  static const String home = '/home';

  static final pages = [
    GetPage(name: instal, page: () => const OnboardView()),
    GetPage(name: home, page: () => const HomeView()),
  ];
}
