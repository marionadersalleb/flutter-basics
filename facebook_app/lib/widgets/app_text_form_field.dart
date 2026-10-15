import 'package:flutter/material.dart';

import '../common/app_colors.dart';

// Text Form Field spec from the brief:
//   Fill #FFFFFF, hint gray #898F9C size 16
//   Font size 16, regular
//   Border radius 16, border side width 2 gray #898F9C
//   Error border width 2 red #EE403D
//   Padding 16, cursor blue
class AppTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: AppColors.blue,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.gray,
        ),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: suffixIcon,
        errorStyle: const TextStyle(color: AppColors.red, fontSize: 12),
        // every state needs its own border, otherwise flutter falls back
        // to its default blue/black underline
        border: buildBorder(AppColors.gray),
        enabledBorder: buildBorder(AppColors.gray),
        focusedBorder: buildBorder(AppColors.gray),
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
