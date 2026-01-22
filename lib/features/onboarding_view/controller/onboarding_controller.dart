import 'package:get/get.dart';
import 'package:test_project/core/constant/app_images.dart';

import '../../../routes/routes.dart';

class OnboardingController extends GetxController {
  RxList<String> pages = [
    AppImages.onImageOne,
    AppImages.onImageTow,
    AppImages.onImageThree,
  ].obs;

  

  RxInt currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 2) {
      currentPage.value++;
    } else {
      Get.offAllNamed(AppRoutes.instal);
    }
  }
}
