import 'package:flutter/material.dart';

import '../models/planet.dart';
import 'planet_info_row.dart';

// The whole details table. The rows come from the planet itself, so
// none of the seven labels is written here.
class PlanetInfoTable extends StatelessWidget {
  final Planet planet;

  const PlanetInfoTable({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: planet.infoRows
          .map((info) => PlanetInfoRow(info: info))
          .toList(),
    );
  }
}
