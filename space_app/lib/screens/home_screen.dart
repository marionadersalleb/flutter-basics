import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../models/planet.dart';
import '../models/planets_data.dart';
import '../widgets/app_button.dart';
import '../widgets/planet_page_item.dart';
import '../widgets/planet_selector.dart';
import '../widgets/stacked_app_bar.dart';
import 'planet_details_screen.dart';

// Screen One.
// A PageView of the planets. Swiping, or tapping an arrow, changes the
// planet. The bottom button label follows the current planet and opens
// the details screen with that planet as the argument.
class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // viewportFraction below 1 lets the neighbouring planets peek in
  final PageController pageController = PageController(viewportFraction: 0.75);

  static const Duration slideDuration = Duration(milliseconds: 350);

  // state lives outside build so it survives every rebuild
  int currentIndex = 0;

  @override
  void dispose() {
    // a controller that is never disposed keeps its resources alive
    pageController.dispose();
    super.dispose();
  }

  Planet get currentPlanet => planets[currentIndex];

  void goToPreviousPlanet() {
    if (currentIndex == 0) return;
    pageController.previousPage(
      duration: slideDuration,
      curve: Curves.easeInOut,
    );
  }

  void goToNextPlanet() {
    if (currentIndex == planets.length - 1) return;
    pageController.nextPage(
      duration: slideDuration,
      curve: Curves.easeInOut,
    );
  }

  void openDetails() {
    Navigator.of(context).pushNamed(
      PlanetDetailsScreen.routeName,
      arguments: currentPlanet,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          const StackedAppBar(
            backgroundImage: 'assets/images/mercury.png',
            topTitle: 'Explore',
            bottomTitle: 'Which planet\nwould you like to explore?',
          ),
          Expanded(
            // Expanded gives the PageView a height, without it the
            // Column would not know how tall to make it
            child: PageView.builder(
              controller: pageController,
              itemCount: planets.length,
              onPageChanged: (index) => setState(() => currentIndex = index),
              itemBuilder: (context, index) => PlanetPageItem(
                planet: planets[index],
                isFocused: index == currentIndex,
              ),
            ),
          ),
          PlanetSelector(
            planetName: currentPlanet.name,
            onPrevious: goToPreviousPlanet,
            onNext: goToNextPlanet,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: AppButton(
              // the label follows the current planet
              text: 'Explore ${currentPlanet.name}',
              icon: Icons.arrow_forward,
              onPressed: openDetails,
            ),
          ),
        ],
      ),
    );
  }
}
