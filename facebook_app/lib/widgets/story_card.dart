import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../models/story.dart';

// A normal story: full bleed image with the user avatar on top.
class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.asset(
              story.storyImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.blue, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(story.userImage, fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                story.userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
