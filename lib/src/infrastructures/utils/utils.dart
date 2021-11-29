import 'package:flutter/material.dart';

class Utils {
  int value = 0;
  static const double tinySpace = 2;
  static const double smallSpace = 4;
  static const double middleSpace = 8;
  static const double largeSpace = 16;
  static const double massiveSpace = 32;
  static const double maxWith = 700;
  static const tinyVerticalSpace = SizedBox(
    height: Utils.tinySpace,
  );
  static const smallVerticalSpace = SizedBox(
    height: Utils.smallSpace,
  );
  static const middleVerticalSpace = SizedBox(
    height: Utils.middleSpace,
  );
  static const largeVerticalSpace = SizedBox(
    height: Utils.largeSpace,
  );
  static const tinyHorizontalSpace = SizedBox(
    width: Utils.tinySpace,
  );
  static const smallHorizontalSpace = SizedBox(
    width: Utils.smallSpace,
  );
  static const middleHorizontalSpace = SizedBox(
    width: Utils.middleSpace,
  );
  static const largeHorizontalSpace = SizedBox(
    width: Utils.largeSpace,
  );


  static const middlePadding = EdgeInsetsDirectional.all(middleSpace);
  static const smallPadding = EdgeInsetsDirectional.all(smallSpace);
  static const tinyPadding = EdgeInsetsDirectional.all(tinySpace);
  static const largePadding = EdgeInsetsDirectional.all(largeSpace);
  static const massivePadding = EdgeInsetsDirectional.all(massiveSpace);





  static void textSelection(final TextEditingController _controller) =>
      _controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _controller.value.text.length,
      );
  static String? validateText(final String text) {
    if (text.isEmpty) {
      return 'این فیلد نباید خالی باشد';
    }
    return null;
  }

}
