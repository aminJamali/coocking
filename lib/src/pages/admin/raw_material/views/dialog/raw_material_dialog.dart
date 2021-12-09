import 'dart:ui';

import 'package:cooking/src/pages/shared/input_field_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../../infrastructures/utils/utils_theme.dart';
import '../../controllers/modify_material_controller.dart';

class RawMaterialDialog extends StatelessWidget {
  final controller = Get.put(ModifyMaterialController());

  RawMaterialDialog({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => _registerRowDialog();

  Widget _registerRowDialog() => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Utils.largeSpace)),
          child: _registerRowDialogItem(),
        ),
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
                  const Text(
                    'تعریف مواد اولیه',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Utils.middleVerticalSpace,
                  InputFieldArea(
                    onChanged: (final onChanged) {},
                    hint: 'مثال : شکر',
                    icon: Icons.food_bank,
                    lable: 'عنوان',
                    controller: controller.rawMaterial,
                    maxLength: 20,
                    validator: (final validator) {},
                    textInputType: TextInputType.text,
                  ),
                  // TextFormField(
                  //     validator: (final text) => Utils.validateText(text ?? ''),
                  //     initialValue: '',
                  //     decoration: UtilsTheme.textFormFieldDecoration(
                  //         hint: 'مثال: شکر', label: 'عنوان'),
                  //     onSaved: (final value) =>
                  //         controller.titleSaved(value ?? '')),
                  Utils.middleVerticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 85.0,
                        child: TextFormField(
                          validator: (final text) =>
                              Utils.validateText(text ?? ''),
                          initialValue: '',
                          decoration: UtilsTheme.textFormFieldDecoration(
                            hint: 'مثال: 10',
                            label: 'مقدار',
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (final value) =>
                              controller.countSaved(value ?? ''),
                        ),
                      ),
                      Utils.largeHorizontalSpace,
                      Expanded(
                        child: DropdownButtonFormField<String>(
                            decoration: UtilsTheme.textFormFieldDecoration(
                                hint: '', label: 'واحد'),
                            // dropdownColor:
                            //     Get.theme.primaryColor,
                            isExpanded: true,
                            isDense: true,
                            onSaved: (final value) =>
                                controller.unitSaved(value ?? ''),
                            onChanged: (final value) {},
                            validator: (final text) =>
                                Utils.validateText(text ?? ''),
                            items: controller.unitItems
                                .map((final items) => DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    ))
                                .toList()),
                      )
                    ],
                  ),
                  Utils.largeVerticalSpace,
                  ElevatedButton.icon(
                      onPressed: controller.submitTaped,
                      icon: const Icon(Icons.app_registration_outlined),
                      label: Text(controller.submitLabel))
                ],
              ),
            ),
          ),
        ),
      );
}
