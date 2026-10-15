import 'package:flutter/material.dart';

import '../common/app_colors.dart';

// Same shape as the primary button but white with a gray border.
// Used for "Create Account".
class AppOutlinedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const AppOutlinedButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          overlayColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.gray, width: 2),
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
