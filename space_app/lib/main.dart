import 'package:flutter/material.dart';

import 'common/app_colors.dart';
import 'screens/explore_screen.dart';
import 'screens/home_screen.dart';
import 'screens/planet_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.red,
          brightness: Brightness.dark,
        ),
      ),
      routes: {
        ExploreScreen.routeName: (_) => const ExploreScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        PlanetDetailsScreen.routeName: (_) => const PlanetDetailsScreen(),
      },
      initialRoute: ExploreScreen.routeName,
    );
  }
}
