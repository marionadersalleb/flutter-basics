import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../widgets/facebook_logo.dart';
import '../widgets/meta_logo.dart';
import 'login_screen.dart';

// A flutter splash screen so the app works out of the box.
//
// The brief also asks for a NATIVE splash (flutter_native_splash).
// That one is configured in pubspec.yaml - see the commented block.
// The native splash shows BEFORE flutter starts, this one after.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      // the user may have left before the timer finished
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(child: Center(child: FacebookLogo(size: 100))),
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: MetaLogo(),
          ),
        ],
      ),
    );
  }
}
