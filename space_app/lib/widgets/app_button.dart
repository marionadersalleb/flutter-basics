import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';

// Brief: "Elevated Button Background Color Red, Padding 16,
//         Elevation 0, Border Radius Circular"
// Text style -> 20, font weight bold.
class AppButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onPressed;

  const AppButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.all(16),
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: AppTextStyles.button),
            // collection-if: the icon is only added when one was given
            if (icon != null) const SizedBox(width: 12),
            if (icon != null) Icon(icon, size: 22, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
