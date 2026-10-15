import 'package:flutter/material.dart';

import '../common/app_assets.dart';

// The ring of beads. This is the only part that turns.
//
// AnimatedRotation animates between two turn values on its own, so no
// AnimationController has to be created and disposed by hand.
class SebhaBody extends StatelessWidget {
  final double turns;
  final double size;
  final void Function()? onTap;

  const SebhaBody({
    super.key,
    required this.turns,
    this.size = 280,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedRotation(
        turns: turns,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        child: Image.asset(
          AppAssets.sebhaBody,
          width: size,
          height: size,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
