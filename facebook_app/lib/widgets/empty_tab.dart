import 'package:flutter/material.dart';

import '../common/app_text_styles.dart';

// Placeholder for the tabs the brief does not ask us to build.
class EmptyTab extends StatelessWidget {
  final String label;

  const EmptyTab({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(label, style: AppTextStyles.titleLarge),
    );
  }
}
