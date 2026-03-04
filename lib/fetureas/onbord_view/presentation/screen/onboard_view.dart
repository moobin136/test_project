import 'package:flutter/material.dart';
import 'package:test_project/core/app_images.dart';
import 'package:test_project/fetureas/onbord_view/presentation/model/onboarding_model.dart';
import 'package:test_project/fetureas/onbord_view/presentation/widgets/onboard_wigets.dart';
import 'package:test_project/routs.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  late final PageController _pageController;
  int currentPage = 0;

  final List<OnboardingModel> onboardDataList = [
    OnboardingModel(
      AppImages.imageOne,
      'Ace your interviews with realistic mock sessions',
      'Build confidence, sharpen your skills, and stand out in any interview with realistic mock sessions.',
    ),
    OnboardingModel(
      AppImages.imageTow,
      'Unlock Career Success with Expert Guidance',
      'Get personalized mock interviews, CV reviews and LinkedIn profile optimization, and direct career consultations from top experts — all in one app.',
    ),
    OnboardingModel(
      AppImages.imageThree,
      'Land Your Next Job Faster with Expert Coaching',
      'Boost your chances of getting hired through tailored mock interviews, professional feedback, and personalized career guidance.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardDataList.length,
                  onPageChanged: (index) {
                    setState(() => currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    final item = onboardDataList[index];
                    return OnboardingPage(
                      imagePath: item.imagePath, 
                      title: item.title,
                      subTitle: item.subTitle,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip button (hide on last page if you want)
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRouts.home,
                        );
                      },
                      child: Text(
                        currentPage == (onboardDataList.length - 1)
                            ? ''
                            : 'Skip',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),

                    Row(
                      children: List.generate(
                        onboardDataList.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: currentPage == index ? 20 : 8,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? Theme.of(context).primaryColor
                                : Colors.grey.shade300,
                            // borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                    ),

                    // Next / Get Started
                    TextButton(
                      onPressed: () {
                        if (currentPage < (onboardDataList.length - 1)) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        } else {
                          // Go to home / sign in
                          Navigator.pushReplacementNamed(
                            context,
                            AppRouts.home,
                          );
                        }
                      },
                      child: Text(
                        currentPage == onboardDataList.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
