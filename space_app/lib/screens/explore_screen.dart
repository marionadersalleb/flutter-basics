import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../widgets/app_button.dart';
import '../widgets/screen_gradient.dart';
import 'home_screen.dart';

// Screen Zero.
// Brief: "The Screen Have 3 Layers Stacked Together
//   Layer One   : Image That Fit All the screen width and height
//   Layer Two   : Text Titled centered in the screen
//   Layer Three : Button Aligned in the bottom of the screen, on press
//                 it will navigate to Home screen"
class ExploreScreen extends StatelessWidget {
  static const String routeName = 'exploreScreen';

  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          // ---- layer one : the image fills the whole screen ----
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/images/mars.png'),
              fit: BoxFit.cover,
            ),
          ),

          // the same veil the app bar uses, a little lighter at the top
          const Positioned.fill(
            child: ScreenGradient(
              colors: [
                Color(0x660E0E0E),
                Color(0x990E0E0E),
                AppColors.black,
              ],
            ),
          ),

          // ---- layer two : the centered title ----
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Explore\nThe\nUniverse',
                textAlign: TextAlign.center,
                style: AppTextStyles.display,
              ),
            ),
          ),

          // ---- layer three : the button at the bottom ----
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              child: AppButton(
                text: 'Explore',
                icon: Icons.arrow_forward,
                onPressed: () =>
                    Navigator.of(context).pushNamed(HomeScreen.routeName),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
