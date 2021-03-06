import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';

import '../commons/advance_http_client.dart';
import '../commons/parameters.dart';
import '../styles/cooking_theme_data.dart';

class Utils {
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
  static const double middleUserImageSize = 50.0;
  static const double largeUserImageSize = 80.0;
  static const middlePadding = EdgeInsetsDirectional.all(middleSpace);
  static const smallPadding = EdgeInsetsDirectional.all(smallSpace);
  static const tinyPadding = EdgeInsetsDirectional.all(tinySpace);
  static const largePadding = EdgeInsetsDirectional.all(largeSpace);
  static const massivePadding = EdgeInsetsDirectional.all(massiveSpace);

  static Future<dynamic> showDialog({
    required final Widget page,
    final Future<void>? Function(dynamic)? thenValue,
  }) {
    if (thenValue != null) {
      return Get.dialog(page, barrierColor: Colors.white10).then(thenValue);
    } else {
      return Get.dialog(page, barrierColor: Colors.white10);
    }
  }

  static void textSelection(final TextEditingController _controller) =>
      _controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _controller.value.text.length,
      );

  static String? validateText(final String? text) {
    if (text?.isEmpty ?? true) {
      return '?????? ???????? ?????????? ???????? ????????';
    }
    return null;
  }

  static AdvanceHttpClient http() {
    final AdvanceHttpClient _httpclient = AdvanceHttpClient(
      baseUrl: Parameters.fullUrl,
      handleExceptionCallBack: (final key) => errorToast(message: key),
    );
    return _httpclient;
  }

  static void errorToast({required final String message}) =>
      Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: message,
          backgroundColor: Get.theme.colorScheme.error);

  static void successToast({required final String message}) =>
      Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          webPosition: 'center',
          msg: message,
          backgroundColor: successColor);

  static Future<FormData> convertToByte(
    final XFile fileDetails,
  ) async {
    final MultipartFile multipartFile = MultipartFile.fromBytes(
      await fileDetails.readAsBytes(),
      filename: fileDetails.name,
    );
    final formData = FormData.fromMap({'file': multipartFile});
    return formData;
  }

  static String convertDurationToTime(final int duration) {
    final String hour =
        convertDurationToHour(duration).toString().padLeft(2, '0');
    final String minute =
        convertDurationToMinute(duration).toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  static int convertDurationToHour(final int duration) => duration ~/ 60;

  static int convertDurationToMinute(final int duration) => duration % 60;
}
