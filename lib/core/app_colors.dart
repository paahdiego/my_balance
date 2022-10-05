import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Colors.green;
  static const Color secondary = Color.fromARGB(255, 0, 87, 55);
  static const Color scaffoldBackgroundColor = white;
  static const Color fontColor = Colors.grey;

  static const Color white = Color(0xFFfefefe);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  static const Color error = Colors.red;

  static Color foregroundColorBasedOnBackground(Color reference) {
    if (reference.computeLuminance() > 0.5) return fontColor;
    return Colors.white;
  }
}
