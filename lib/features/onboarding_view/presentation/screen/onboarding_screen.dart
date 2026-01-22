// ── Screen ───────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/features/onboarding_view/controller/onboarding_controller.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/global_wights/custom_button.dart';
import '../../../../core/global_wights/custom_text.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final onboardingController = Get.find<OnboardingController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardingList.length,
                itemBuilder: (context, index) {
                  final item = controller.onboardingList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image
                      Image.asset(item.imagePth),
                      const SizedBox(height: 86),
                      // Text + description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 37),
                        child: Column(
                          children: [
                            CustomText(
                              text: item.text,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            CustomText(
                              text: item.description,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Dots + Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Page indicators
                  Obx(
                    () => Row(
                      children: List.generate(
                        controller.onboardingList.length,
                        (index) {
                          final isActive =
                              controller.currentIndex.value == index;
                          return Container(
                            margin: const EdgeInsets.only(left: 8),
                            width: 8, // better dot style
                            height: isActive ? 20 : 12,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.primary
                                  : AppColors.primary.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Button (Skip / Get Started)
                  Obx(
                    () {
                      final isLastPage = controller.currentIndex.value ==
                          controller.onboardingList.length - 1;
                      return CustomContainerButton(
                        text: isLastPage ? 'Get Started' : 'Skip',
                        onPressed: () {
                          if (isLastPage) {
                            controller.goToLogin();
                          } else {
                            controller.nextPage();
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 52),
          ],
        ),
      ),
    );
  }
}
