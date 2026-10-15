import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

import '../common/app_colors.dart';

// The 3D viewer. It owns its own controller, which keeps the package
// and its lifecycle out of the details screen.
class PlanetModelViewer extends StatefulWidget {
  final String modelPath;
  final double height;

  const PlanetModelViewer({
    super.key,
    required this.modelPath,
    this.height = 280,
  });

  @override
  State<PlanetModelViewer> createState() => _PlanetModelViewerState();
}

class _PlanetModelViewerState extends State<PlanetModelViewer> {
  final Flutter3DController controller = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Flutter3DViewer(
        src: widget.modelPath,
        controller: controller,
        progressBarColor: AppColors.red,
      ),
    );
  }
}
