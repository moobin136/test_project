import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/constant/app_colors.dart';
import 'package:test_project/core/constant/app_images.dart';
import 'package:test_project/core/global_wights/custom_button.dart';
import 'package:test_project/core/global_wights/custom_text.dart';
import 'package:test_project/routes/routes.dart';

import '../model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> onboardingList = [
    OnboardingModel(
        text: 'Discover New People While You Travel Daily.',
        description:
            'Discover people around you on your daily commute whether for dating, networking, or just a friendly chat.',
        imagePth: AppImages.onImageOne),
    OnboardingModel(
        text: 'Slide, Match, and Start Talking Right Away.',
        description:
            'Slide to show interest. Only mutual slides open the door to conversation no pressure, no awkwardness.',
        imagePth: AppImages.onImageTow),
    OnboardingModel(
        text: 'Reconnect with People from Your Last Ride.',
        description:
            'Check in, see who’s nearby even connect with people you shared the same train with even after the ride ends.',
        imagePth: AppImages.onImageThree),
  ];

  int _carnetIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  setState(() {
                    _carnetIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///!images
                        Image.asset(onboardingList[index].imagePth),

                        const SizedBox(height: 86),
                        //! text and description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 37.0),
                          child: Column(children: [
                            CustomText(
                              text: onboardingList[index].text,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            CustomText(
                              text: onboardingList[index].description,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(height: 80),
                          ]),
                        ),
                      ]);
                },
              ),
            ),

            //! indication ======>>> button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(onboardingList.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(left: 8),
                        width: 8,
                        height: (_carnetIndex == index) ? 20 : 12,
                        decoration: BoxDecoration(
                            color: (_carnetIndex == index)
                                ? AppColors.primary
                                : AppColors.primary.withAlpha(50),
                            borderRadius: BorderRadius.circular(50)),
                      );
                    }),
                  ),
                  CustomContainerButton(
                    text: _carnetIndex == onboardingList.length - 1
                        ? 'Net Page'
                        : 'Skip',
                    textColor: _carnetIndex == onboardingList.length - 1
                        ? AppColors.textPrimary
                        : AppColors.white,
                    onPressed: () {
                      if (_carnetIndex == (onboardingList.length - 1)) {
                        Get.toNamed(AppRoutes.login);
                        return;
                      } else {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear);
                      }
                    },
                  )
                ],
              ),
            ),

            const SizedBox(height: 52)
          ],
        )),
      ),
    );
  }
}
