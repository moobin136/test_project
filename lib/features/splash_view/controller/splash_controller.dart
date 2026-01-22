import 'package:get/get.dart';

import '../../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      // Navigate to the next screen, e.g., onboarding or home
      Get.offNamed(AppRoutes.onboarding);
    });
  }
}
