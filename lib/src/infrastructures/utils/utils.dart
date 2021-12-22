import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData,MultipartFile;
import 'package:image_picker/image_picker.dart';

import '../commons/advance_http_client.dart';
import '../commons/parameters.dart';

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
  static const middlePadding = EdgeInsetsDirectional.all(middleSpace);
  static const smallPadding = EdgeInsetsDirectional.all(smallSpace);
  static const tinyPadding = EdgeInsetsDirectional.all(tinySpace);
  static const largePadding = EdgeInsetsDirectional.all(largeSpace);
  static const massivePadding = EdgeInsetsDirectional.all(massiveSpace);

  static Future<dynamic> showDialog({required final Widget page}) =>
      Get.dialog(page, barrierColor: Colors.white10);

  static void textSelection(final TextEditingController _controller) =>
      _controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _controller.value.text.length,
      );

  static String? validateText(final String? text) {
    if (text?.isEmpty ?? true) {
      return 'این فیلد نباید خالی باشد';
    }
    return null;
  }

  static AdvanceHttpClient http() {
    final AdvanceHttpClient _httpclient = AdvanceHttpClient(
      baseUrl: Parameters.fullUrl,
      handleExceptionCallBack: handleException,
    );
    return _httpclient;
  }

  static void handleException(final String exceptionKey) =>
      Fluttertoast.showToast(
          msg: exceptionKey, backgroundColor: Get.theme.colorScheme.error);

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
}
