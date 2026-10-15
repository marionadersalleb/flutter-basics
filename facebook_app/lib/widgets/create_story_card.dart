import 'package:flutter/material.dart';

import '../common/app_assets.dart';
import '../common/app_colors.dart';

// The first item in the stories list.
// Split 3 : 1 - the image on top, the white strip with the label below.
class CreateStoryCard extends StatelessWidget {
  const CreateStoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.gray, width: 1),
      ),
      // ClipRRect stops the image painting over the rounded corners
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                AppAssets.story1,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                alignment: const Alignment(0, 0.6),
                color: AppColors.white,
                child: const Text(
                  'Create a\nStory',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
