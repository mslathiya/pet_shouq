import 'package:flutter/material.dart';

import 'app.colors.dart';
import 'text.theme.dart';

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
    timePickerTheme: _timePickerTheme,
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
    timePickerTheme: _timePickerTheme,
  );

  static final _timePickerTheme = TimePickerThemeData(
    backgroundColor: AppColors.white,
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: AppColors.timeSelector, width: 2),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: AppColors.backgroundLight, width: 2),
    ),
    dayPeriodTextColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? AppColors.white
          : AppColors.fontMain,
    ),
    hourMinuteColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? AppColors.secondary
          : AppColors.white,
    ),
    hourMinuteTextColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? Colors.white
          : AppColors.secondary,
    ),
    dialHandColor: AppColors.timeSelector,
    dialBackgroundColor: AppColors.backgroundLight,
    hourMinuteTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    dayPeriodTextStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    helpTextStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
    ),
    dialTextColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? AppColors.secondary
          : AppColors.fontMain,
    ),
    entryModeIconColor: Colors.orange,
  );
}
