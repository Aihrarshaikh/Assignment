import 'package:flutter/material.dart';

class AppColors {
  static const Color heading = Color(0xFFCCC8FF);
  static const Color smallText = Color(0xCBC9FFB2);
  static const Color highlight = Color(0xFF8B88EF);
  static const Color questionTile = Color(0xFF232A2E);
  static const Color normalText = Color(0xFFC4C4C4);
  static const Color boldText = Color(0xFFF5F5F5);
}

final ThemeData appTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.heading,
    onPrimary: Colors.white,
    secondary: AppColors.highlight,
    onSecondary: Colors.white,
    background: Colors.black,
    onBackground: Colors.white,
    surface: AppColors.questionTile,
    onSurface: Colors.white,
    error: Colors.red,
    onError: Colors.white,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.heading,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    headlineMedium: TextStyle(
      color: AppColors.heading,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    bodyLarge: TextStyle(
      color: AppColors.normalText,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: AppColors.smallText,
      fontSize: 15,
    ),
    bodySmall: TextStyle(
      color: AppColors.boldText,
      fontWeight: FontWeight.bold,
      fontSize: 13,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.highlight),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.heading),
    titleTextStyle: TextStyle(
      color: AppColors.heading,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
); 