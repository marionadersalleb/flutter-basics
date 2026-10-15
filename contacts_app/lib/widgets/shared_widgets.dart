import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';

// The brief asks for the Route logo as an image in the app bar, but no
// logo file came with the assets, so it is drawn here as text.
// Export route_logo.png into assets/images/ and flip [useImageLogo]
// to true to swap it in.
class RouteLogo extends StatelessWidget {
  static const bool useImageLogo = false;

  final double height;

  const RouteLogo({super.key, this.height = 34});

  @override
  Widget build(BuildContext context) {
    if (useImageLogo) {
      return Image.asset('assets/images/route_logo.png', height: height);
    }

    return SizedBox(
      height: height,
      child: FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: 14, height: 2, color: AppColors.gold),
            const Text(
              'Route',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: AppColors.gold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Elevated Button spec from the brief:
//   Background Gold #FFF1D4, Foreground Dark Blue #29384D
//   Font Size 20, Font Weight Regular, Text Align Center
//   Overlay Color Transparent, Border Radius 16, Padding 16
class AppElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const AppElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.darkBlue,
          overlayColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.button,
        ),
      ),
    );
  }
}

// Text Form Field spec from the brief:
//   Fill Dark Blue #29384D, Hint Light Blue #E2F4F6 size 16
//   Font Size 16, Regular, Border Radius 16
//   Border Side width 2 Gold #FFF1D4
//   Error Border width 2 Red #EE403D
//   Padding 16, Cursor Gold
class AppTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: AppColors.gold,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.lightBlue,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkBlue,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.lightBlue,
        ),
        contentPadding: const EdgeInsets.all(16),
        errorStyle: const TextStyle(color: AppColors.red, fontSize: 12),
        // each state needs its own border, otherwise flutter falls back
        // to its default underline
        border: buildBorder(AppColors.gold),
        enabledBorder: buildBorder(AppColors.gold),
        focusedBorder: buildBorder(AppColors.gold),
        errorBorder: buildBorder(AppColors.red),
        focusedErrorBorder: buildBorder(AppColors.red),
      ),
    );
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
