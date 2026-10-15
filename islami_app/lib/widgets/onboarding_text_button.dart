import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';

// The Back / Next / Finish labels at the bottom of the onboarding flow.
// One widget covers all three - only the label and the action change.
class OnboardingTextButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const OnboardingTextButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.gold,
        overlayColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      ),
      child: Text(label, style: AppTextStyles.buttonGold18),
    );
  }
}
