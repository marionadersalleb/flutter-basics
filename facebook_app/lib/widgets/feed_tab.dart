import 'package:flutter/material.dart';

import '../models/post.dart';
import 'post_card.dart';
import 'story_list.dart';
import 'what_is_in_your_mind.dart';

// The first tab: the prompt row, the stories strip, then the posts.
//
// One ListView.builder handles the whole feed. Index 0 is the header
// (prompt + stories), every index after that is a post. Adding a post
// to the data file adds it here with no code change.
class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: posts.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) return const FeedHeader();
        return PostCard(post: posts[index - 1]);
      },
    );
  }
}

// Kept next to FeedTab because it is the header of this list and
// nothing else uses it.
class FeedHeader extends StatelessWidget {
  const FeedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WhatIsInYourMind(),
        StoryList(),
        SizedBox(height: 20),
      ],
    );
  }
}
