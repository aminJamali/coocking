import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';

class RecipeUtils{
 static BoxDecoration itemDecoration() => BoxDecoration(
      border: Border.all(
        color: Get.theme.colorScheme.primary,
        width: 1.0,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(Utils.middleSpace),
      ));
}