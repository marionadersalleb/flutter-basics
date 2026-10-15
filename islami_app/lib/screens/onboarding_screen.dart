import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../common/app_colors.dart';
import '../models/onboarding_page_data.dart';
import '../widgets/islami_header.dart';
import '../widgets/onboarding_page_item.dart';
import '../widgets/onboarding_text_button.dart';
import 'sebha_screen.dart';

// The five-slide intro flow.
//
// The slides come from onboardingPages, so adding a sixth slide means
// adding one entry to that list - nothing in this file changes.
class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onboardingScreen';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // the controller drives the PageView; the buttons use it to animate
  final PageController pageController = PageController();

  static const Duration slideDuration = Duration(milliseconds: 300);

  // state lives outside build so it survives every rebuild
  int currentIndex = 0;

  @override
  void dispose() {
    // a controller that is never disposed keeps its resources alive
    pageController.dispose();
    super.dispose();
  }

  bool get isFirstPage => currentIndex == 0;
  bool get isLastPage => currentIndex == onboardingPages.length - 1;

  void goBack() {
    pageController.previousPage(
      duration: slideDuration,
      curve: Curves.easeInOut,
    );
  }

  void goNext() {
    if (isLastPage) {
      finish();
      return;
    }
    pageController.nextPage(
      duration: slideDuration,
      curve: Curves.easeInOut,
    );
  }

  void finish() {
    // pushReplacement so the user cannot swipe back into the intro
    Navigator.of(context).pushReplacementNamed(SebhaScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const IslamiHeader(),
              Expanded(
                // Expanded gives the PageView a height, without it the
                // Column would not know how tall to make it
                child: PageView.builder(
                  controller: pageController,
                  itemCount: onboardingPages.length,
                  onPageChanged: (index) =>
                      setState(() => currentIndex = index),
                  itemBuilder: (context, index) =>
                      OnboardingPageItem(page: onboardingPages[index]),
                ),
              ),
              const SizedBox(height: 16),
              buildControls(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // the first slide has no Back button, but the row still needs
        // something on the left so the dots stay centred
        isFirstPage
            ? const SizedBox(width: 64)
            : OnboardingTextButton(label: 'Back', onPressed: goBack),

        SmoothPageIndicator(
          controller: pageController,
          count: onboardingPages.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 3,
            spacing: 6,
            activeDotColor: AppColors.gold,
            dotColor: AppColors.white,
          ),
        ),

        OnboardingTextButton(
          label: isLastPage ? 'Finish' : 'Next',
          onPressed: goNext,
        ),
      ],
    );
  }
}
