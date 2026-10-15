import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../widgets/shared_widgets.dart';
import 'home_screen.dart';

// Brief: "Splash Screen: Features the app logo prominently on a
// minimalist background, offering a seamless entry experience."
class SplashScreen extends StatefulWidget {
  static const String routeName = 'splashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  void goToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      // the user may have left before the timer finished
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: RouteLogo(height: 70),
      ),
    );
  }
}
