import 'package:flutter/material.dart';

import '../common/app_text_styles.dart';
import '../models/onboarding_page_data.dart';

// One slide of the onboarding flow. It knows nothing about which slide
// it is - the screen hands it the data.
class OnboardingPageItem extends StatelessWidget {
  final OnboardingPageData page;

  const OnboardingPageItem({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Image.asset(page.image, fit: BoxFit.contain),
          ),
        ),
        Text(
          page.title,
          textAlign: TextAlign.center,
          style: AppTextStyles.titleGold20,
        ),
        // collection-if: the first slide has no subtitle, so nothing is
        // built for it rather than an empty gap being left behind
        if (page.subtitle.isNotEmpty) const SizedBox(height: 12),
        if (page.subtitle.isNotEmpty)
          Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyWhite16,
          ),
      ],
    );
  }
}
