import 'package:flutter/material.dart';

import '../models/planet.dart';

// One page of the planet PageView. The focused planet is drawn bigger
// than its neighbours, and the size change is animated so tapping an
// arrow looks the same as swiping.
class PlanetPageItem extends StatelessWidget {
  final Planet planet;
  final bool isFocused;

  const PlanetPageItem({
    super.key,
    required this.planet,
    required this.isFocused,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: isFocused ? 16 : 56,
      ),
      child: Image.asset(planet.image, fit: BoxFit.contain),
    );
  }
}
