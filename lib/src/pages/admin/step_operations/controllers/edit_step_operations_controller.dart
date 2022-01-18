import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/pages/admin/step_operations/controllers/modify_step_operations_controller.dart';
import 'package:cooking/src/pages/admin/step_operations/models/step_operation_view_model.dart';
import 'package:cooking/src/pages/admin/step_operations/repositories/modify_step_operation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class EditStepOperationController extends ModifyStepOperationController {
  EditStepOperationController(this.initStepOperationViewModel);
  StepOperationViewModel initStepOperationViewModel;
  ModifyStepOperationRepository repository = ModifyStepOperationRepository();

  @override
  void modifyStepOperation() {
    if (modifyMaterialFormKey.currentState!.validate()) {
      if (addStepOperationDto.avatarId != null) {
        modifyMaterialFormKey.currentState!.save();
        editStepOperation();
      } else {
        Utils.errorToast(message: 'انتخاب تصویر اجباری می باشد!');
      }
    }
  }

  Future<void> editStepOperation() async {
    loadingSubmit.value = true;
    final Either<String, String> result = await repository.editStepOperation(
      stepOperationId: stepOperationViewModel.id!,
      addstepOperationDto: addStepOperationDto,
    );
    result.fold((final exception) => loadingSubmit.value = false,
        (final result) {
      loadingSubmit.value = false;
      _onSuccess();
    });
  }

  void _onSuccess() {
    final StepOperationViewModel _finalStepOperation =
        addStepOperationDto.convertToViewModel(
            id: initStepOperationViewModel.id!,
            unitTitle: initStepOperationViewModel.title!);
    Get.back(result: _finalStepOperation);
    Utils.successToast(message: 'مرحله پخت با موفقیت ویرایش گردید');
  }
}
