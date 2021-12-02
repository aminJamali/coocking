import 'package:flutter/material.dart';

import '../utils/utils.dart';

// const MaterialColor primarySwatch = MaterialColor(0xFF5BC8AC, {
//   50: Color(0xFFEBF8F5),
//   100: Color(0xFFCEEFE6),
//   200: Color(0xFFADE4D6),
//   300: Color(0xFF8CD9C5),
//   400: Color(0xFF74D0B8),
//   500: Color(0xFF5BC8AC),
//   600: Color(0xFF53C2A5),
//   700: Color(0xFF49BB9B),
//   800: Color(0xFF40B492),
//   900: Color(0xFF2FA782),
// });
const MaterialColor primarySwatch = Colors.purple;

final Color secondaryColor = Colors.amberAccent[700]!;
final Color successColor = Colors.green.shade500;
const Color infoColor = Colors.teal;
final Color backgroundColor = primarySwatch[50]!;
const Color warningColor = Color(0xFFffc107);
final Color dangerColor = Colors.red.withOpacity(.8);
final Color disabledColor = Colors.grey.withOpacity(.8);

ThemeData cookingThemeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: primarySwatch,
    accentColor: secondaryColor,
    backgroundColor: backgroundColor,
    primaryColorDark: primarySwatch[700],
    errorColor: dangerColor,
  ),
  disabledColor: disabledColor,
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: 'IRANSans',
floatingActionButtonTheme:FloatingActionButtonThemeData(
  backgroundColor: secondaryColor,
  splashColor: Colors.white,
  foregroundColor: Colors.white,
) ,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      onPrimary: Colors.white,
    ),
  ),
  buttonTheme:  ButtonThemeData(
    buttonColor: secondaryColor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Utils.middleSpace))),
  ),
);
