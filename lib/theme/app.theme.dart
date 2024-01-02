import 'package:flutter/material.dart';
import 'package:pet_shouq/theme/app.colors.dart';
import 'package:pet_shouq/theme/text.theme.dart';

class AppTheme {
  static final ColorScheme _lightScheme = ColorScheme.light(
    background: AppColors.backgroundLight,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.secondary,
    brightness: Brightness.light,
    surface: AppColors.backgroundLight,
    surfaceVariant: AppColors.backgroundLight,
  );

  static final ColorScheme _darkScheme = ColorScheme.light(
    background: AppColors.backgroundDark,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.secondary,
    brightness: Brightness.dark,
    surface: AppColors.backgroundDark,
    surfaceVariant: AppColors.backgroundDark,
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    iconTheme: IconThemeData(
      color: AppColors.primary,
    ),
    colorScheme: _lightScheme,
    textTheme: textTheme(
      color: AppColors.fontMain,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: _darkScheme.onSurface,
    iconTheme: IconThemeData(
      color: AppColors.primary,
    ),
    colorScheme: _darkScheme,
    textTheme: textTheme(
      color: AppColors.fontMain,
    ),
  );
}
