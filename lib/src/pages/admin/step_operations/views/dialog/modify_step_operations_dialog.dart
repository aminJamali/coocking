import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/infrastructures/utils/utils_theme.dart';
import 'package:cooking/src/pages/admin/step_operations/controllers/add_step_operation_controller.dart';
import 'package:cooking/src/pages/admin/step_operations/controllers/modify_step_operations_controller.dart';
import 'package:cooking/src/pages/shared/views/dialogs/blur_dialog.dart';
import 'package:cooking/src/pages/shared/views/fill_button.dart';
import 'package:cooking/src/pages/shared/views/getx_view.dart';
import 'package:cooking/src/pages/shared/views/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModifyStepOperationsDialog<T extends ModifyStepOperationController>
    extends GetxView<T> {
  const ModifyStepOperationsDialog(final GetxViewBuilder<T> controller,
      {final Key? key})
      : super(controller, key: key);

  @override
  Widget build(final BuildContext context) => BlurDialog(
        dialogChild: _registerRowDialogItem(),
      );

  Widget _registerRowDialogItem() => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: Utils.largePadding,
            child: Form(
              key: controller.modifyMaterialFormKey,
              child: Column(
                children: [
                  Utils.smallVerticalSpace,
                  ..._header(),
                  Utils.largeVerticalSpace,
                  ImagePickers(
                    onPickFile: onImageSelected,
                    avatarId: controller.addStepOperationDto.avatarId,
                  ),
                  Padding(
                    padding: Utils.largePadding,
                    child: _title(),
                  ),
                  Utils.largeVerticalSpace,
                  _submitButton(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _submitButton() => FillButton(
        title: 'ذخیـره',
        onPressed: controller.modifyStepOperation,
        loading: controller.loadingSubmit.value,
      );

  Widget _title() => TextFormField(
        validator: Utils.validateText,
        initialValue: controller.addStepOperationDto.title,
        decoration: UtilsTheme.textFormFieldDecoration(
            hint: 'مثال: گوجه ها را خورد میکنیم', label: 'عنوان'),
        onSaved: (final value) => controller.addStepOperationDto.title = value!,
      );

  List<Widget> _header() => [
        Utils.largeVerticalSpace,
        Icon(
          Icons.app_registration_outlined,
          color: Get.theme.colorScheme.primary,
          size: 45,
        ),
        Utils.middleVerticalSpace,
        _headerTitle(),
      ];

  Text _headerTitle() => Text(
        'تعریف مرحله پخت',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(Get.context!).colorScheme.primary),
      );

  void onImageSelected(final String avatarId) {
    controller.addStepOperationDto.avatarId = avatarId;
    controller.addStepOperationDto.extension = 'jpg';
  }
}
