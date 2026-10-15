import 'package:flutter/material.dart';

import '../common/app_text_styles.dart';
import 'action_button.dart';
import 'screen_gradient.dart';

// Brief: "This app Bar is Stacked layers Component consist of
//   - Image Background
//   - Filled Gradient on the top of the image
//   - The top Title is positioned on the Top center of the image
//   - The bottom title is positioned in the bottom left of the image"
//
// Screen Two uses the same component plus a back button, and puts the
// bottom title in the center left.
class StackedAppBar extends StatelessWidget {
  final String backgroundImage;
  final String topTitle;
  final String bottomTitle;
  final bool showBackButton;

  const StackedAppBar({
    super.key,
    required this.backgroundImage,
    required this.topTitle,
    required this.bottomTitle,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // ClipRRect actually cuts the image, borderRadius on a decoration
      // would only round the background behind it
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: Stack(
          children: [
            // ---- layer 1 : the image ----
            Positioned.fill(
              child: Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),

            // ---- layer 2 : the gradient on top of it ----
            const Positioned.fill(child: ScreenGradient()),

            // ---- layer 3 : the top title, centered ----
            Positioned(
              top: 48,
              left: 0,
              right: 0,
              child: Text(
                topTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.titleLarge,
              ),
            ),

            // ---- layer 4 : the bottom title ----
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Text(
                bottomTitle,
                style: AppTextStyles.bodyLarge,
              ),
            ),

            // ---- layer 5 : the back button (details screen only) ----
            if (showBackButton)
              Positioned(
                top: 44,
                left: 12,
                child: ActionButton(
                  icon: Icons.arrow_back,
                  size: 40,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
