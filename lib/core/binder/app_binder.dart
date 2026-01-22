import 'package:get/get.dart';

import '../../features/onboarding_view/controller/onboarding_controller.dart';
import '../../features/splash_view/controller/splash_controller.dart';

class AppBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    // Get.lazyPut(() => OnboardingController());
    // Get.lazyPut(() => SplashController(),);
  }
}
