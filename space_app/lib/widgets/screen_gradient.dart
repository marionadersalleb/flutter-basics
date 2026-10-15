import 'package:flutter/material.dart';

import '../common/app_colors.dart';

// The dark veil that sits over a planet photo so white text stays
// readable. Used by the app bar and by Screen Zero, which is why it
// lives here instead of being written twice.
class ScreenGradient extends StatelessWidget {
  final List<Color> colors;

  const ScreenGradient({
    super.key,
    this.colors = const [
      Color(0xCC0E0E0E),
      Color(0x660E0E0E),
      AppColors.black,
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
    );
  }
}
