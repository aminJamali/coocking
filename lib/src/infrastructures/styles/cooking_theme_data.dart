import 'package:flutter/material.dart';

import '../utils/utils.dart';

const MaterialColor primarySwatch = MaterialColor(0xFF8C6C14, {
  50: Color(0xFFF1EDE3),
  100: Color(0xFFDDD3B9),
  200: Color(0xFFC6B68A),
  300: Color(0xFFAF985B),
  400: Color(0xFF9D8237),
  500: Color(0xFF8C6C14),
  600: Color(0xFF846412),
  700: Color(0xFF79590E),
  800: Color(0xFF6F4F0B),
  900: Color(0xFF5C3D06),
});
//const MaterialColor primarySwatch = Colors.purple;

const Color secondaryColor = Color(0xFF158f46);
final Color successColor = Colors.green.shade500;
const Color infoColor = Colors.teal;
final Color backgroundColor = primarySwatch[100]!;
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
  textTheme: const TextTheme(
    button: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  ),
  floatingActionButtonTheme: floatingActionButtonThemeData(),
  elevatedButtonTheme: elevatedButtonThemeData(),
  outlinedButtonTheme: outlinedButtonThemeData(),
  buttonTheme: buttonThemeData(),
);

FloatingActionButtonThemeData floatingActionButtonThemeData() =>
    const FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
      splashColor: Colors.white,
      foregroundColor: Colors.white,
    );

ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: secondaryColor,
        onPrimary: Colors.white,
      ),
    );

ButtonThemeData buttonThemeData() => const ButtonThemeData(
      buttonColor: secondaryColor,
      textTheme: ButtonTextTheme.accent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Utils.middleSpace))),
    );

OutlinedButtonThemeData outlinedButtonThemeData() => OutlinedButtonThemeData(
      style: ButtonStyle(
          side: MaterialStateProperty.all(
        const BorderSide(
          style: BorderStyle.solid,
          color: secondaryColor,
          width: 2.0,
        ),
      )),
    );
