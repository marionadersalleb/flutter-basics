import 'package:flutter/material.dart';

import '../common/app_text_styles.dart';
import '../models/planet.dart';

// One underlined "label : value" line of the details table.
class PlanetInfoRow extends StatelessWidget {
  final PlanetInfo info;

  const PlanetInfoRow({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(info.label, style: AppTextStyles.bodyLarge),
              ),
              Text(info.value, style: AppTextStyles.bodyLarge),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0x33FFFFFF),
          ),
        ],
      ),
    );
  }
}
