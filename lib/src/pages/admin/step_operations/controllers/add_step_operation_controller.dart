import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/pages/admin/step_operations/controllers/modify_step_operations_controller.dart';
import 'package:cooking/src/pages/admin/step_operations/repositories/modify_step_operation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class AddStepOperationController extends ModifyStepOperationController {
  ModifyStepOperationRepository repository = ModifyStepOperationRepository();
  @override
  void modifyStepOperation() {
    if (modifyMaterialFormKey.currentState!.validate()) {
      if (addStepOperationDto.avatarId != null) {
        modifyMaterialFormKey.currentState!.save();
        addStepOperation();
      } else {
        Utils.errorToast(message: 'انتخاب تصویر اجباری می باشد!');
      }
    }
  }

  Future<void> addStepOperation() async {
    loadingSubmit.value = true;
    final Either<String, int> result = await repository.adddStepOperation(
        addStepOperationDto: addStepOperationDto);
    result.fold((final exception) => loadingSubmit.value = false,
        (final result) {
      loadingSubmit.value = false;
      Get.back(result: true);
      Utils.successToast(message: 'مرحله پخت با موفقیت ثبت گردید');
    });
  }
}
