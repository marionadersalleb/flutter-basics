import 'package:flutter/material.dart';

import '../common/app_colors.dart';

// The facebook logo was not in the exported assets, so it is drawn here.
// To use the real one: export fb_logo.png into assets/images/ and
// replace the body with Image.asset('assets/images/fb_logo.png').
class FacebookLogo extends StatelessWidget {
  final double size;

  const FacebookLogo({super.key, this.size = 90});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: const Alignment(0, -0.15),
      decoration: BoxDecoration(
        color: AppColors.blue,
        // radius = half the size makes a circle
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Text(
        'f',
        style: TextStyle(
          color: AppColors.white,
          fontSize: size * 0.72,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
    );
  }
}
