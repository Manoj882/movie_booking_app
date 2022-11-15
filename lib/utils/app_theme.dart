import 'package:flutter/material.dart';
import 'package:movie_booking_app/main.dart';

class AppTheme {
  static const mainColor = Color(0xFF3EB489 );
  static const statusBarColor = Color(0xFF2E3147);
  static const appBarColor = Color(0xFF222539);
  static const greyColor = Color(0xFFF4F4F4);
  static const redLight = Color(0xFFFFF1F0);
  static const blueLight = Color(0xFFF5F9FF);
  static const greenColor = Color(0xFF2EC492);
  static const orangeColor = Color(0xFFEB8D2F);
  static const blueBorder = Color(0xFF3164CE);
  static const redBorder = Color(0xFFF14336);

  static const redTextColor = Color(0xFFD05045);
  static const greenTextColor = Color(0xFF8CC153);

  static List<Color> redGiftGradientColors = [
    const Color(0xFFFCCAC6).withOpacity(0.3),
    const Color(0xFFDB5449).withOpacity(0.3),
  ];
  static List<Color> greenGiftGradientColors = [
    const Color(0xFF89D980).withOpacity(0.3),
    const Color(0xFF34BA25).withOpacity(0.3),
  ];

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
