import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      cardColor: AppColors.cardLight,
      dividerColor: AppColors.borderLight,
      textTheme: _textTheme(AppColors.foregroundLight),
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        surface: AppColors.cardLight,
        error: AppColors.destructiveLight,
        onPrimary: AppColors.white,
        onSecondary: AppColors.black,
        onSurface: AppColors.foregroundLight,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      cardColor: AppColors.cardDark,
      dividerColor: AppColors.borderDark,
      textTheme: _textTheme(AppColors.foregroundDark),
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        surface: AppColors.cardDark,
        error: AppColors.destructiveDark,
        onPrimary: AppColors.black,
        onSecondary: AppColors.white,
        onSurface: AppColors.foregroundDark,
      ),
    );
  }

  static TextTheme _textTheme(Color textColor) {
    return GoogleFonts.interTextTheme(
      TextTheme(
        // h1 -> displayLarge / titleLarge
        displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: textColor, height: 1.5),
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: textColor, height: 1.5),
        
        // h2 -> displayMedium / titleMedium
        displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: textColor, height: 1.5),
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: textColor, height: 1.5),
        
        // h3 -> displaySmall / titleSmall
        displaySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: textColor, height: 1.5),
        titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: textColor, height: 1.5),
        
        // h4 -> headlineMedium / headlineSmall
        headlineMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor, height: 1.5),
        headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor, height: 1.5),
        
        // p / body
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: textColor, height: 1.5),
        bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: textColor, height: 1.5),
        
        // button
        labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor, height: 1.5),
      ),
    );
  }
}

