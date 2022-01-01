import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ModifyStepOperationController extends GetxController {
  GlobalKey<FormState> modifyMaterialFormKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  RxBool loadingSubmit = false.obs;

  void modifyStepOperation() {}
}
