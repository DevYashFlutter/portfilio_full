import 'package:flutter/material.dart';

class AppColors {
  // Common Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF030213);

  // Light Theme Colors (from :root)
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color foregroundLight = Color(0xFF252525);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color primaryLight = Color(0xFF030213);
  static const Color secondaryLight = Color(0xFFF0F2F5);
  static const Color mutedLight = Color(0xFFECECF0);
  static const Color mutedForegroundLight = Color(0xFF717182);
  static const Color accentLight = Color(0xFFE9EBEF);
  static const Color borderLight = Color(0x1A000000); // 0.1 opacity
  static const Color destructiveLight = Color(0xFFD4183D);

  // Dark Theme Colors (from .dark)
  static const Color backgroundDark = Color(0xFF252525);
  static const Color foregroundDark = Color(0xFFFAFAFA);
  static const Color cardDark = Color(0xFF252525);
  static const Color primaryDark = Color(0xFFFAFAFA);
  static const Color secondaryDark = Color(0xFF454545);
  static const Color mutedDark = Color(0xFF454545);
  static const Color mutedForegroundDark = Color(0xFFB5B5B5);
  static const Color accentDark = Color(0xFF454545);
  static const Color borderDark = Color(0xFF454545);
  static const Color destructiveDark = Color(0xFFA82020);

  // Aliases for the default theme (preserving some names for compatibility)
  static const Color background = backgroundDark;
  static const Color surface = cardDark;
  static const Color purple = Color(0xFFA855F7); 
  static const Color cyan = Color(0xFF22D3EE);   
  static const Color blue = Color(0xFF3B82F6);
  
  static const Color textHeader = foregroundDark;
  static const Color textBody = mutedForegroundDark;

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryDark, Color(0xFF707070)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

