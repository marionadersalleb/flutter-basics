import 'package:flutter/material.dart';

import '../common/app_assets.dart';
import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../models/dhikr.dart';
import '../widgets/dhikr_counter.dart';
import '../widgets/islami_header.dart';
import '../widgets/sebha_body.dart';
import '../widgets/sebha_header.dart';

// The interactive rosary.
//
// Task sheet rules implemented here:
//   - every tap adds 1 to the counter and turns the bead ring slightly
//   - the header stays completely still
//   - at 33 the counter resets to 0 and the phrase moves to the next one
class SebhaScreen extends StatefulWidget {
  static const String routeName = 'sebhaScreen';

  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  // state lives outside build so it survives every rebuild
  int count = 0;
  int phraseIndex = 0;
  double turns = 0;

  // one bead of the ring, so the beads line up with the count
  static const double turnPerTap = 1 / Dhikr.target;

  String get currentPhrase => Dhikr.phrases[phraseIndex];

  void onSebhaTap() {
    setState(() {
      // the ring keeps turning in one direction, it never resets
      turns += turnPerTap;
      count++;

      if (count == Dhikr.target) {
        count = 0;
        // wrap back to the first phrase after the last one
        phraseIndex = (phraseIndex + 1) % Dhikr.phrases.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // layer 1: the photo
          Image.asset(AppAssets.sebhaBackground, fit: BoxFit.cover),

          // layer 2: a dark veil so the gold text stays readable
          Container(color: const Color(0xCC202020)),

          // layer 3: the screen itself
          SafeArea(
            child: Column(
              children: [
                const IslamiHeader(),
                const SizedBox(height: 16),
                Text(
                  Dhikr.heading,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleGold20,
                ),
                Expanded(child: buildSebha()),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSebha() {
    // LayoutBuilder reads the space actually left for the sebha, so the
    // ring shrinks on small phones instead of overflowing. The task
    // sheet asks for a "Responsive UI".
    return LayoutBuilder(
      builder: (context, constraints) {
        final double ringSize = constraints.maxHeight * 0.55;
        return buildSebhaColumn(ringSize);
      },
    );
  }

  Widget buildSebhaColumn(double ringSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // the header sits OUTSIDE the rotating widget, which is what
        // keeps it still while the beads turn
        const SebhaHeader(),

        Stack(
          alignment: Alignment.center,
          children: [
            SebhaBody(turns: turns, size: ringSize, onTap: onSebhaTap),
            // the text sits on top of the ring and does not turn with it
            DhikrCounter(phrase: currentPhrase, count: count),
          ],
        ),

        const SizedBox(height: 24),
        Text(
          'Tap the beads to count',
          style: AppTextStyles.bodyWhite16.copyWith(
            color: AppColors.white.withAlpha(140),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
