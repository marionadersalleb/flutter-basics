import 'package:flutter/material.dart';

import '../common/app_colors.dart';

// The small gold piece at the top of the sebha.
//
// It is NOT part of the rotating body - the task sheet is explicit:
// "the header remains completely static and fixed in its position".
// No separate asset was exported for it, so it is drawn here. Swap in
// Image.asset(...) if the design file provides one later.
class SebhaHeader extends StatelessWidget {
  const SebhaHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // the knob
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        // the stem reaching down toward the beads
        Container(
          width: 10,
          height: 22,
          decoration: const BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
