import 'package:flutter/material.dart';

import '../common/app_assets.dart';
import '../common/app_colors.dart';
import '../common/app_text_styles.dart';

// The row under the app bar: avatar, prompt, images icon.
class WhatIsInYourMind extends StatelessWidget {
  const WhatIsInYourMind({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AppAssets.avatar,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // the brief says this field has no outer decoration
          const Expanded(
            child: Text(
              "What's in Your Mind?",
              style: AppTextStyles.bodyLarge,
            ),
          ),
          const Icon(Icons.photo_library, color: Color(0xff45BD62), size: 28),
        ],
      ),
    );
  }
}
