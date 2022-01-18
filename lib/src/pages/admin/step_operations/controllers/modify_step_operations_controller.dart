import 'package:cooking/src/pages/admin/step_operations/models/add_step_operation_dto.dart';
import 'package:cooking/src/pages/admin/step_operations/models/step_operation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ModifyStepOperationController extends GetxController {
  GlobalKey<FormState> modifyMaterialFormKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  RxBool loadingSubmit = false.obs;
  AddStepOperationDto addStepOperationDto = AddStepOperationDto(title: '');
  StepOperationViewModel stepOperationViewModel = StepOperationViewModel();

  void modifyStepOperation() {}
}
