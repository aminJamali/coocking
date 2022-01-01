import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils.dart';

class UtilsTheme {
  int ignoreError = 0;

  static InputDecoration textFormFieldDecoration({
    required final String label,
    final String? hint,
  }) =>
      InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: Utils.smallPadding,
        filled: true,
        errorStyle: errorTextStyle(),
        focusedBorder: UtilsTheme.setOutlineBorder(
            color: Get.theme.colorScheme.primary, width: 2.0),
        errorBorder: setOutlineBorder(color: Get.theme.errorColor, width: 2.0),
        fillColor: Get.theme.colorScheme.background,
        enabledBorder: UtilsTheme.setOutlineBorder(
            color: Get.theme.colorScheme.primary, width: 1.0),
      );

  static TextStyle errorTextStyle() => TextStyle(color: Get.theme.errorColor);

  static OutlineInputBorder setOutlineBorder(
          {required final Color color, final double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(Utils.middleSpace),
        borderSide: BorderSide(width: width, color: color),
      );

  static ButtonStyle errorOutlineButtonStyle() =>OutlinedButton.styleFrom(
    primary: Colors.black,
    side: BorderSide(
      style: BorderStyle.solid,
      color: Get.theme.colorScheme.error,
      width: 2.0,
    ),
  )
;

  static ButtonStyle errorFillButtonStyle() => ElevatedButton.styleFrom(
        primary: Get.theme.colorScheme.error,
        onPrimary: Colors.white,
      );
}
