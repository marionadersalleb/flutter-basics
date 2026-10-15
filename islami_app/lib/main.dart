import 'package:flutter/material.dart';

import 'common/app_theme.dart';
import 'screens/onboarding_screen.dart';
import 'screens/sebha_screen.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routes: {
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        SebhaScreen.routeName: (_) => const SebhaScreen(),
      },
      initialRoute: OnboardingScreen.routeName,
    );
  }
}
