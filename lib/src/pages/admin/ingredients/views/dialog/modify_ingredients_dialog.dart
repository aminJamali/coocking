import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../../infrastructures/utils/utils_theme.dart';
import '../../../../shared/views/blur_dialog.dart';
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
                  const ImagePickers(),
                  Utils.middleVerticalSpace,
                  _title(),
                  Utils.middleVerticalSpace,
                  _units(),
                  Utils.largeVerticalSpace,
                  ElevatedButton(
                      onPressed: controller.submitTaped,
                      child: Text(controller.submitLabel))
                ],
              ),
            ),
          ),
        ),
      );

  DropdownButtonFormField<String> _units() => DropdownButtonFormField<String>(
      decoration: UtilsTheme.textFormFieldDecoration(label: 'واحد'),
      // dropdownColor:
      //     Get.theme.primaryColor,
      isExpanded: true,
      isDense: true,
      onSaved: (final value) => controller.unitSaved(value!),
      onChanged: (final value) {},
      validator: Utils.validateText,
      items: controller.unitItems
          .map((final items) => DropdownMenuItem(
                value: items,
                child: Text(items),
              ))
          .toList());

  TextFormField _title() => TextFormField(
      validator: Utils.validateText,
      initialValue: controller.ingredientsViewModel?.title,
      decoration:
          UtilsTheme.textFormFieldDecoration(hint: 'مثال: شکر', label: 'عنوان'),
      onSaved: (final value) => controller.titleSaved(value!));

  List<Widget> _header() => [
        Icon(
          Icons.app_registration_outlined,
          color: Get.theme.colorScheme.primary,
          size: 35,
        ),
        _headerTitle(),
      ];

  Text _headerTitle() => Text(
        'تعریف مواد اولیه',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(Get.context!).colorScheme.primary),
      );
}
