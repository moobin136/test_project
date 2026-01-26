import 'package:get/get.dart';
import 'package:test_project/features/home_view/presentation/screen/home_screen.dart';
import 'package:test_project/features/splash_view/presentation/screen/splash_screen.dart';

import '../features/aut_view/presentation/screen/login_screen.dart';
import '../features/camera_view/presentation/screen/image_&_camera_path.dart';
import '../features/onboarding_view/presentation/screen/onboarding_screen.dart';

class AppRoutes {
  static String instal = '/splash_screen';
  static String onboarding = '/onboarding_screen';
  static String galleryAndCamera = '/galleryAndCameraView';
  static String login = '/loginView';
  static String home = '/home_screen';

  static final List<GetPage> pages = [
    GetPage(name: instal, page: () => SplashScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(name: galleryAndCamera, page: () => ImageAndCameraFilePath()),
    GetPage(name: login, page: () => LoginScreen()),
    // GetPage(name: login, page: () => GalleryANdCameraView()),
  ];
}
