import 'package:flutter/material.dart';

import '../common/app_colors.dart';

// Brief: "Action Button is Elevated button with Circular edges and icon,
//         background color is red and foreground Color is white,
//         the icon size is 22"
class ActionButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final void Function()? onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    this.size = 48,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          // CircleBorder makes a real circle, a BorderRadius on a square
          // would only round its corners
          shape: const CircleBorder(),
        ),
        child: Icon(icon, size: 22, color: AppColors.white),
      ),
    );
  }
}
