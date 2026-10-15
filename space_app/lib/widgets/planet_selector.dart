import 'package:flutter/material.dart';

import '../common/app_text_styles.dart';
import 'action_button.dart';

// The planet name sitting between the two arrow buttons.
class PlanetSelector extends StatelessWidget {
  final String planetName;
  final void Function()? onPrevious;
  final void Function()? onNext;

  const PlanetSelector({
    super.key,
    required this.planetName,
    this.onPrevious,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ActionButton(icon: Icons.arrow_back, onPressed: onPrevious),
          Expanded(
            child: Text(
              planetName,
              textAlign: TextAlign.center,
              style: AppTextStyles.titleLarge,
            ),
          ),
          ActionButton(icon: Icons.arrow_forward, onPressed: onNext),
        ],
      ),
    );
  }
}
