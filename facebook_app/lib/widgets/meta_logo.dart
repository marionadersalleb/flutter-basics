import 'package:flutter/material.dart';

import '../common/app_colors.dart';

// "from Meta" branding at the bottom of the splash and login screens.
// Replace with Image.asset('assets/images/meta_logo.png') when exported.
class MetaLogo extends StatelessWidget {
  const MetaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\u221E',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        SizedBox(width: 6),
        Text(
          'Meta',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
