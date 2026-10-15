import 'package:flutter/material.dart';

import '../common/app_colors.dart';

// One of the three round buttons in the home app bar.
class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const CircleIconButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 36,
          height: 36,
          alignment: const Alignment(0, 0),
          decoration: BoxDecoration(
            color: const Color(0xffE4E6EB),
            // radius = half the width makes a circle
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(icon, size: 20, color: AppColors.black),
        ),
      ),
    );
  }
}
