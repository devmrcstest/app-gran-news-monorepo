import 'dart:ui';

import 'package:flutter/material.dart';

import 'gran_colors.dart';

class GranColorsDark implements GranColors {
  @override
  final MaterialColor primary = const MaterialColor(
    0xFF101820,
    <int, Color>{
      50: Color(0xFF0068FF),
      100: Color(0xFF0068FF),
      200: Color(0xFF0068FF),
      300: Color(0xFF0068FF),
      400: Color(0xFF0068FF),
      500: Color(0xFF0068FF),
      600: Color(0xFF0068FF),
      700: Color(0xFF0068FF),
      800: Color(0xFF0068FF),
      900: Color(0xFF0068FF),
    },
  );

  @override
  final Color primaryDark = const Color(0xFF091D40);

  @override
  final Color white = const Color(0xFFFFFFFF);
  @override
  final Color black = const Color(0xFF1D1D1D);

  @override
  final Color blue = const Color(0xFF0068FF);
  @override
  final Color red = const Color(0xFFF44236);
}
