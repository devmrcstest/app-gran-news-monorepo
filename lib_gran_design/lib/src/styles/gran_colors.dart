import 'package:flutter/material.dart';

import 'gran_colors_dark.dart';
import 'gran_colors_light.dart';

abstract class GranColors {
  final MaterialColor primary;
  final Color primaryDark;

  final Color black;
  final Color white;

  final Color red;
  final Color blue;

  GranColors(
    this.primary,
    this.primaryDark,
    this.black,
    this.white,
    this.red,
    this.blue,
  );

  static GranColors of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? GranColorsLight()
        : GranColorsDark();
  }
}
