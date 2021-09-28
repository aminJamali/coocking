import 'package:flutter/material.dart';

String? _fontFamily;

class CookingTheme {
  final String? fontFamily;

  CookingTheme({final this.fontFamily}) {
    _fontFamily = fontFamily;
  }

  ThemeData get themeData => _taavThemeData;
}

double _radius = 2.0;
const Color primaryColor = Color(0xFF43056A);
const Color secondaryColor = Color(0xFF7F09C8);
const Color accentColor = Colors.purple;
final Color successColor = Colors.green.shade500;
final Color infoColor = Colors.teal;
const Color warningColor = Color(0xFFffc107);
final Color dangerColor = Colors.red.withOpacity(.8);
final Color disabledColor = Colors.grey.withOpacity(.8);

final ThemeData _taavThemeData = ThemeData(
  fontFamily: _fontFamily,
);
