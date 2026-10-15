// One "label : value" line of the details table.
class PlanetInfo {
  final String label;
  final String value;

  const PlanetInfo(this.label, this.value);
}

class Planet {
  final String name;
  final String image;
  final String model;
  final String title;
  final String about;

  final double distanceFromSun; // km
  final double lengthOfDay;     // hours
  final double orbitalPeriod;   // earth years
  final double radius;          // km
  final String mass;            // kg, already formatted in the sheet
  final double gravity;         // m/s2
  final String surfaceArea;     // km2, already formatted in the sheet

  const Planet({
    required this.name,
    required this.image,
    required this.model,
    required this.title,
    required this.about,
    required this.distanceFromSun,
    required this.lengthOfDay,
    required this.orbitalPeriod,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
  });

  // The seven rows of the details table, described once here instead of
  // being written out seven times in the screen. The screen just loops
  // over this list, so adding a row means adding one line below.
  List<PlanetInfo> get infoRows => [
        PlanetInfo('Distance from Sun (km)', _format(distanceFromSun)),
        PlanetInfo('Length of Day (hours)', _format(lengthOfDay)),
        PlanetInfo('Orbital Period (Earth years)', _format(orbitalPeriod)),
        PlanetInfo('Radius (km)', _format(radius)),
        PlanetInfo('Mass (kg)', mass),
        PlanetInfo('Gravity (m/s\u00B2)', _format(gravity)),
        PlanetInfo('Surface Area (km\u00B2)', surfaceArea),
      ];

  // 6371.0 should read 6371, but 23.93 must keep its decimals
  static String _format(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toString();
  }
}
