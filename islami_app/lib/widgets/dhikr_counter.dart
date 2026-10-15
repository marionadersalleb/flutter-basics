import 'package:flutter/material.dart';

import '../common/app_text_styles.dart';

// The phrase and the count, shown in the middle of the bead ring.
class DhikrCounter extends StatelessWidget {
  final String phrase;
  final int count;

  const DhikrCounter({
    super.key,
    required this.phrase,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(phrase, style: AppTextStyles.dhikrGold28),
        const SizedBox(height: 8),
        Text('$count', style: AppTextStyles.counterWhite24),
      ],
    );
  }
}
