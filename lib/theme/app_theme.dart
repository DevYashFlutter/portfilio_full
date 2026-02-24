import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: GoogleFonts.interTextTheme(
        const TextTheme(
          displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -1.5),
          displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: AppColors.textHeader),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 18, color: AppColors.textBody, height: 1.5),
          bodyMedium: TextStyle(fontSize: 14, color: AppColors.textBody),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.purple,
        brightness: Brightness.dark,
        primary: AppColors.purple,
        secondary: AppColors.cyan,
      ).copyWith(surface: AppColors.background),
    );
  }
}
