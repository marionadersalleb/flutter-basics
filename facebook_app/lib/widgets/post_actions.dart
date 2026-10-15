import 'package:flutter/material.dart';

import '../common/app_colors.dart';

// Like, comment and share on the left, bookmark on the right.
class PostActions extends StatelessWidget {
  const PostActions({super.key});

  static const List<IconData> leftIcons = [
    Icons.favorite_border,
    Icons.mode_comment_outlined,
    Icons.send_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // the three icons are described once and mapped into widgets,
        // same pattern as the tab icons in home_app_bar
        ...leftIcons.map(
          (icon) => Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(icon, color: AppColors.black),
          ),
        ),
        // Spacer pushes the bookmark to the far right
        const Spacer(),
        const Icon(Icons.bookmark_border, color: AppColors.black),
      ],
    );
  }
}
