import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0A0118);
  static const Color sectionBg = Color(0xFF0F0320);
  static const Color surface = Color(0xFF1E0A3E);

  static const Color purple = Color(0xFFC27AFF);
  static const Color cyan = Color(0xFF00D3F3);
  static const Color blue = Color(0xFF51A2FF);
  static const Color magenta = Color(0xFFF6339A);

  static const Color textBody = Color(0xFFD1D5DC);
  static const Color textHeader = Color(0xFFE5E7EB);
  static const Color textAccent = Color(0xFFDAB2FF);

  static const LinearGradient primaryGradient = LinearGradient(colors: [purple, cyan], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static const LinearGradient accentGradient = LinearGradient(colors: [purple, magenta], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static const LinearGradient cyanBlueGradient = LinearGradient(colors: [cyan, blue], begin: Alignment.topLeft, end: Alignment.bottomRight);
}
