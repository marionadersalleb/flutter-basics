import 'package:flutter/material.dart';

import 'app_colors.dart';

// Text sizes listed in the brief
class AppTextStyles {
  // Title Large -> 24, bold, white
  static const TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  // Body Large -> 16, regular, white
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  // Button text -> 20, bold
  static const TextStyle button = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  // Screen Zero headline -> 48, bold, white
  static const TextStyle display = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    height: 1.1,
  );
}
