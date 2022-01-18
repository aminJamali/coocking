import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../../infrastructures/utils/utils_theme.dart';
import '../../controllers/recipe_modify_base_controller.dart';
import '../../models/recipe_category_view_model.dart';
import '../../models/recipe_nationality_view_model.dart';
import 'duration_picker.dart';

class RecipeModify<T extends RecipeModifyBaseController> extends GetView<T> {
  const RecipeModify({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appBar(),
        body: _body(),
      );

  AppBar _appBar() => AppBar(
        title: Text(controller.pageTitle),
        centerTitle: true,
        excludeHeaderSemantics: true,
      );

  Widget _body() => Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Utils.maxWith),
          child: Form(
            key: controller.modifyRecipeFormKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _foodName(),
                  Utils.largeVerticalSpace,
                  DurationPicker(
                    title: 'زمان پخت*',
                    duration: controller.duration,
                    onDurationChange: (final duration) =>
                        controller.duration = duration,
                  ),
                  Utils.largeVerticalSpace,
                  _category(),
                  Utils.largeVerticalSpace,
                  _nationalities(),
                  Utils.largeVerticalSpace,
                  Divider(
                    thickness: Utils.smallSpace,
                    color: Get.theme.colorScheme.secondary,
                    indent: Utils.largeSpace,
                    endIndent: Utils.largeSpace,
                  ),
                  Utils.largeVerticalSpace,
                ],
              ),
            ),
          ),
        ),
      );

  Widget _foodName() => TextFormField(
      validator: Utils.validateText,
      decoration: UtilsTheme.textFormFieldDecoration(
          hint: 'مثال: کاچی', label: 'نام غذا*'));

  Widget _category() => Obx(
        () => controller.categoryListLoading.value
            ? const CircularProgressIndicator()
            : DropdownButtonFormField<RecipeCategoryViewModel>(
                value: controller.selectedCategory,
                decoration:
                    UtilsTheme.textFormFieldDecoration(label: 'دسته بندی*'),
                onSaved: controller.onCategorySelected,
                onChanged: (final value) => {},
                validator: (final value) => Utils.validateText(value?.title),
                items: controller.categoryItems
                    .map((final items) => DropdownMenuItem(
                          value: items,
                          child: Text(items.title),
                        ))
                    .toList()),
      );

  Widget _nationalities() => Obx(
        () => controller.nationalityListLoading.value
            ? const CircularProgressIndicator()
            : DropdownButtonFormField<RecipeNationalityViewModel>(
                value: controller.selectedNationality,
                decoration: UtilsTheme.textFormFieldDecoration(label: 'ملیت*'),
                onSaved: controller.onNationalitySelected,
                onChanged: (final value) => {},
                validator: (final value) => Utils.validateText(value?.name),
                items: controller.nationalityItems
                    .map((final items) => DropdownMenuItem(
                          value: items,
                          child: Text(items.name),
                        ))
                    .toList()),
      );
}
