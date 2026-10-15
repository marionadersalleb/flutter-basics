import '../common/app_assets.dart';

// One onboarding slide. The five slides are described here as data, so
// the screen loops over this list instead of repeating the same widget
// five times with different strings.
class OnboardingPageData {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPageData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

const List<OnboardingPageData> onboardingPages = [
  OnboardingPageData(
    image: AppAssets.onboarding1,
    title: 'Welcome To Islami App',
    subtitle: '',
  ),
  OnboardingPageData(
    image: AppAssets.onboarding2,
    title: 'Welcome To Islami',
    subtitle: 'We Are Very Excited To Have You In Our Community',
  ),
  OnboardingPageData(
    image: AppAssets.onboarding3,
    title: 'Reading the Quran',
    subtitle: 'Read, and your Lord is the Most Generous',
  ),
  OnboardingPageData(
    image: AppAssets.onboarding4,
    title: 'Bearish',
    subtitle: 'Praise the name of your Lord, the Most High',
  ),
  OnboardingPageData(
    image: AppAssets.onboarding5,
    title: 'Holy Quran Radio',
    subtitle:
        'You can listen to the Holy Quran Radio through the application '
        'for free and easily',
  ),
];
