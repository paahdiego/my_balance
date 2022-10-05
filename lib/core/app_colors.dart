import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF109310);
  static const Color secondary = Color(0xFF72B01D);
  static const Color backgroundColor = black;
  static const Color subBackgroundColor = Color(0xFF212224);
  static const Color fontColor = white;
  static const Color inputBackgroundColor = white;
  static const Color drawerBackgroundColor = Color(0xFF141414);

  static const Color white = Color(0xFFfaf9f9);
  static const Color black = Color(0xFF0B090A);

  static const Color warning = Color(0xFFF2C14E);
  static const Color error = Color(0xFFf78e31);

  static const Color transparent = Colors.transparent;

  static Color foregroundColorBasedOnBackground(Color reference) {
    if (reference.computeLuminance() > 0.5) return fontColor;
    return Colors.white;
  }
}
