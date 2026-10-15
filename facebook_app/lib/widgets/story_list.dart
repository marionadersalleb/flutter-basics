import 'package:flutter/material.dart';

import '../models/story.dart';
import 'create_story_card.dart';
import 'story_card.dart';

// The horizontal stories strip, height 220 as the brief asks.
//
// itemCount is stories.length + 1 because index 0 is the
// "Create a Story" card and the rest come from the list. Adding a
// story to the data file adds a card here with no code change.
class StoryList extends StatelessWidget {
  const StoryList({super.key});

  static const double listHeight = 220;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return const CreateStoryCard();
          return StoryCard(story: stories[index - 1]);
        },
      ),
    );
  }
}
