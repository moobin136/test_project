import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/constant/app_images.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final OnboardingScreen onboardingController = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.only(top: 90, bottom: 52),
        child: PageView.builder(
          itemCount: 3,
          // onPageChanged: (value) {
          //   onboardingController.currentPage.value = value;
          // } ,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Image.asset(AppImages.onImageOne);
          },
        ),
      ),
    );
  }
}
