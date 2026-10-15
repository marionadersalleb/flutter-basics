import 'package:flutter/material.dart';

import '../common/app_assets.dart';

// The gold "Islami" wordmark with the mosque silhouette behind it.
// Appears at the top of every screen in the app.
class IslamiHeader extends StatelessWidget {
  final double height;

  const IslamiHeader({super.key, this.height = 90});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.header,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
