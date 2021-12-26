import 'dart:ui';

import 'package:cooking/src/pages/admin/ingredients/models/ingredient_units_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../../infrastructures/utils/utils_theme.dart';
import '../../../../shared/views/dialogs/blur_dialog.dart';
import '../../../../shared/views/fill_button.dart';
import '../../../../shared/views/getx_view.dart';
import '../../../../shared/views/image_picker.dart';
import '../../controllers/ingredients_modify_controller.dart';

class ModifyIngredientsDialog<T extends IngredientsModifyController>
    extends GetxView<T> {
  const ModifyIngredientsDialog(final GetxViewBuilder<T> controller,
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
                    avatarId: controller.ingredientsViewModel?.avatarId,
                  ),
                  Padding(
                    padding: Utils.largePadding,
                    child: _title(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Utils.largeSpace),
                    child: _units(),
                  ),
                  Utils.largeVerticalSpace,
                  _submitButton(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _submitButton() => Obx(() => FillButton(
        title: 'ذخیـره',
        onPressed: controller.submitTaped,
        loading: controller.loadingSubmit.value,
      ));

  Widget _units() => Obx(
        () => controller.unitListLoading.value
            ? const CircularProgressIndicator()
            : DropdownButtonFormField<IngredientUnitsViewModel>(
                value: controller.selectedUnit,
                decoration: UtilsTheme.textFormFieldDecoration(label: 'واحد'),
                onSaved: (final value) =>
                    controller.ingredientsDto.ingredientUnitId = value!.id,
                onChanged: (final value) => {},
                validator: (final value) => Utils.validateText(value?.title),
                items: controller.unitItems
                    .map((final items) => DropdownMenuItem(
                          value: items,
                          child: Text(items.title),
                        ))
                    .toList()),
      );

  Widget _title() => TextFormField(
      validator: Utils.validateText,
      initialValue: controller.ingredientsViewModel?.title,
      decoration:
          UtilsTheme.textFormFieldDecoration(hint: 'مثال: شکر', label: 'عنوان'),
      onSaved: (final value) => controller.ingredientsDto.title = value!);

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

  Widget _headerTitle() => Text(
        'تعریف مواد اولیه',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(Get.context!).colorScheme.primary),
      );

  void onImageSelected(final String avatarId) {
    controller.ingredientsDto.avatarId = avatarId;
    controller.ingredientsDto.extension = 'jpg';
  }
}
