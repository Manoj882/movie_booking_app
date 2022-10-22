import 'package:flutter/material.dart';
import 'package:movie_booking_app/main.dart';

class AppTheme {
  static const mainColor = Color(0xFF3EB489 );
  static const statusBarColor = Color(0xFF2E3147);
  static const appBarColor = Color(0xFF222539);
  static const greyColor = Color(0xFFF4F4F4);
  static const redLight = Color(0xFFFFF1F0);
  static const blueLight = Color(0xFFF5F9FF);

  static final lightTheme = ThemeData(
    primaryColor: mainColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: Colors.white.withOpacity(0.7),
        inherit: true,
      ),
    ),
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.light(
        background: mainColor,
        primary: mainColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: appBarColor,
    ),
  );
}
