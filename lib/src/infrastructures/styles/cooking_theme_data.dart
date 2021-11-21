import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF43056A);
const MaterialColor primarySwatch = MaterialColor(0xFF43056A, {
  50: Color(0xFFFFF6FF),
  100: Color(0xFFFAB5FF),
  200: Color(0xFFCA88F1),
  300: Color(0xFF9C5DC2),
  400: Color(0xFF6F3395),
  500: Color(0xFF43056A),
  600: Color(0xFF330352),
  700: Color(0xFF200134),
  800: Color(0xFF200048),
  900: Color(0xFF1A0041),
});

final Color successColor = Colors.green.shade500;
final Color infoColor = Colors.teal;
const Color warningColor = Color(0xFFffc107);
final Color dangerColor = Colors.red.withOpacity(.8);
final Color disabledColor = Colors.grey.withOpacity(.8);

ThemeData cookingThemeData = ThemeData(
  primaryColor: primaryColor,
  backgroundColor: Colors.red,
  disabledColor: disabledColor,
  errorColor: dangerColor,
  primarySwatch: primarySwatch,
  fontFamily: 'IRANSans',
);
