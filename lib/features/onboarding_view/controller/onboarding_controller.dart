import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_images.dart';
import '../../../routes/routes.dart';
import '../presentation/model/onboarding_model.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final RxInt currentIndex = 0.obs;

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      text: 'Discover New People While You Travel Daily.',
      description:
          'Discover people around you on your daily commute whether for dating, networking, or just a friendly chat.',
      imagePth: AppImages.onImageOne,
    ),
    OnboardingModel(
      text: 'Slide, Match, and Start Talking Right Away.',
      description:
          'Slide to show interest. Only mutual slides open the door to conversation no pressure, no awkwardness.',
      imagePth: AppImages.onImageTow,
    ),
    OnboardingModel(
      text: 'Reconnect with People from Your Last Ride.',
      description:
          'Check in, see who’s nearby even connect with people you shared the same train with even after the ride ends.',
      imagePth: AppImages.onImageThree,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentIndex.value = pageController.page?.round() ?? 0;
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void goToLogin() {
    Get.offNamed(AppRoutes.login);
  }
}
