import 'package:flutter/material.dart';

import '../models/post.dart';
import 'post_actions.dart';
import 'post_header.dart';

// One post: header, image, actions.
class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(post: post),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              post.postImage,
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          const PostActions(),
        ],
      ),
    );
  }
}
