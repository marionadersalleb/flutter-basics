import 'package:flutter/material.dart';

import '../common/app_colors.dart';

// Elevated Button spec from the brief:
//   Background #1877F2, Foreground #FFFFFF
//   Font Size 20, regular, centered
//   Overlay colour transparent, Border radius 16, padding 16
class AppElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const AppElevatedButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
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
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
