import 'package:flutter/material.dart';

import 'app_colors.dart';

// Text sizes listed in the brief
class AppTextStyles {
  // Title Large -> 20, bold, gold
  static const TextStyle titleLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.gold,
  );

  // Title Medium -> 16, bold, gold
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.gold,
  );

  // Body Small -> 10, regular, gold
  static const TextStyle bodySmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.gold,
  );

  // Button text -> 20, regular, dark blue (from the button spec)
  static const TextStyle button = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.darkBlue,
  );
}
