import 'package:flutter/material.dart';

import 'app_colors.dart';

// The three text styles listed in the brief under "Text Sizes"
class AppTextStyles {
  static const TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.gray,
  );
}
