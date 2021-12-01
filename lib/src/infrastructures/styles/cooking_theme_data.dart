import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:flutter/material.dart';

const MaterialColor primarySwatch = MaterialColor(0xFF43056A, {
  50: Color(0xFFE8E1ED),
  100: Color(0xFFC7B4D2),
  200: Color(0xFFA182B5),
  300: Color(0xFF7B5097),
  400: Color(0xFF5F2B80),
  500: Color(0xFF43056A),
  600: Color(0xFF3D0462),
  700: Color(0xFF340457),
  800: Color(0xFF2C034D),
  900: Color(0xFF1E013C),
});

final Color successColor = Colors.green.shade500;
final Color infoColor = Colors.teal;
const Color warningColor = Color(0xFFffc107);
final Color dangerColor = Colors.red.withOpacity(.8);
final Color disabledColor = Colors.grey.withOpacity(.8);

ThemeData cookingThemeData = ThemeData(
  primaryColor: primarySwatch,
  primarySwatch: primarySwatch,
  backgroundColor: primarySwatch[50],
  disabledColor: disabledColor,
  errorColor: dangerColor,
  fontFamily: 'IRANSans',
  scaffoldBackgroundColor: primarySwatch[50],
  iconTheme: const IconThemeData(color: primarySwatch),
  buttonTheme: const ButtonThemeData(
    padding: Utils.middlePadding,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Utils.middleSpace))),
  ),
);
