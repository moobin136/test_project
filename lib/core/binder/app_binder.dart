import 'package:get/get.dart';
import 'package:test_project/features/aut_view/controller/login_controller.dart';
import 'package:test_project/features/camera_view/controller/image_&_camera_file_path_controller.dart';

import '../../features/onboarding_view/controller/onboarding_controller.dart';
import '../../features/splash_view/controller/splash_controller.dart';

class AppBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    Get.lazyPut<LoginController>(() => LoginController());

    Get.lazyPut<ImageAndCameraFilePathController>(
        () => ImageAndCameraFilePathController());
    // Get.lazyPut(() => SplashController(),);
    /* 
     */
  }
}
