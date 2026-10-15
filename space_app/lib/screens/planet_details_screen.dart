import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../models/planet.dart';
import '../widgets/planet_info_table.dart';
import '../widgets/planet_model_viewer.dart';
import '../widgets/stacked_app_bar.dart';

// Screen Two.
// Shows the planet that Screen One passed as a route argument:
// the 3D model, the About text, and the data table.
class PlanetDetailsScreen extends StatelessWidget {
  static const String routeName = 'planetDetailsScreen';

  const PlanetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // the planet arrives through the route arguments
    final Planet planet = ModalRoute.of(context)!.settings.arguments as Planet;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          StackedAppBar(
            backgroundImage: planet.image,
            topTitle: planet.name,
            bottomTitle: planet.title,
            showBackButton: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlanetModelViewer(modelPath: planet.model),
                  const SizedBox(height: 24),
                  const Text('About', style: AppTextStyles.titleLarge),
                  const SizedBox(height: 8),
                  Text(planet.about, style: AppTextStyles.bodyLarge),
                  const SizedBox(height: 24),
                  PlanetInfoTable(planet: planet),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
