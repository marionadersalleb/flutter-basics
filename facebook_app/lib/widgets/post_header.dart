import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../models/post.dart';

// Avatar, name, time, privacy icon and the "more" dots.
class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            post.userImage,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.userName, style: AppTextStyles.titleMedium),
              Row(
                children: [
                  Text(
                    post.time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.gray,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.public, size: 12, color: AppColors.gray),
                ],
              ),
            ],
          ),
        ),
        const Icon(Icons.more_horiz, color: AppColors.black),
      ],
    );
  }
}
