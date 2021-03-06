import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../../infrastructures/utils/utils_theme.dart';
import '../../../../shared/views/fill_button.dart';
import '../../controllers/recipe_modify_base_controller.dart';
import '../../models/recipe_category_view_model.dart';
import '../../models/recipe_nationality_view_model.dart';
import '../utils/recipe_utils.dart';
import 'duration_picker.dart';
import 'recipe_modify_document.dart';
import 'recipe_modify_ingredient.dart';
import 'recipe_modify_step_operation.dart';

class RecipeModify<T extends RecipeModifyBaseController> extends GetView<T> {
  const RecipeModify({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appBar(),
        body: Obx(
              () =>
          controller.getInitLoading.value
              ? const Center(child: CircularProgressIndicator())
              : _body(),
        ),
      );

  AppBar _appBar() =>
      AppBar(
        title: Text(controller.pageTitle),
        centerTitle: true,
        excludeHeaderSemantics: true,
      );

  Widget _body() =>
      Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Utils.maxWith),
          child: Form(
            key: controller.modifyRecipeFormKey,
            child: Padding(
              padding: Utils.middlePadding,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _foodName(),
                    Utils.largeVerticalSpace,
                    _duration(),
                    Utils.largeVerticalSpace,
                    _category(),
                    Utils.largeVerticalSpace,
                    _nationalities(),
                    Utils.largeVerticalSpace,
                    _divider(),
                    Utils.largeVerticalSpace,
                    RecipeModifyIngredient<T>(),
                    Utils.largeVerticalSpace,
                    _divider(),
                    Utils.largeVerticalSpace,
                    RecipeModifyStepOperation<T>(),
                    Utils.largeVerticalSpace,
                    _divider(),
                    Utils.largeVerticalSpace,
                    RecipeModifyDocument<T>(),
                    Utils.largeVerticalSpace,
                    _divider(),
                    Utils.largeVerticalSpace,
                    Utils.largeVerticalSpace,
                    _submitButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _submitButton() =>
      Obx(() =>
          FillButton(
            title: '??????????',
            loading: controller.submitLoading.value,
            onPressed: controller.onSubmitTaped,
          ));

  Widget _divider() =>
      Divider(
        thickness: Utils.smallSpace,
        color: Get.theme.colorScheme.secondary,
        indent: Utils.largeSpace,
        endIndent: Utils.largeSpace,
      );

  Widget _duration() =>
      Container(
        padding: Utils.middlePadding,
        decoration: RecipeUtils.itemDecoration(),
        child: Obx(() => DurationPicker(
            title: '???????? ??????*',
            duration: controller.duration.value,
            onDurationChange: (final duration) =>
            controller.duration.value = duration,
          )),
      );

  Widget _foodName() =>
      TextFormField(
          controller: controller.foodNameTextController,
          validator: Utils.validateText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: UtilsTheme.textFormFieldDecoration(
              hint: '????????: ????????', label: '?????? ??????*'));

  Widget _category() =>
      Obx(
            () =>
        controller.categoryListLoading.value
            ? const CircularProgressIndicator()
            : DropdownButtonFormField<RecipeCategoryViewModel>(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            value: controller.selectedCategory,
            decoration:
            UtilsTheme.textFormFieldDecoration(label: '???????? ????????*'),
            onChanged: controller.onCategorySelected,
            validator: (final value) => Utils.validateText(value?.title),
            items: controller.categoryItems
                .map((final items) =>
                DropdownMenuItem(
                  value: items,
                  child: Text(items.title),
                ))
                .toList()),
      );

  Widget _nationalities() =>
      Obx(
            () =>
        controller.nationalityListLoading.value
            ? const CircularProgressIndicator()
            : DropdownButtonFormField<RecipeNationalityViewModel>(
            value: controller.selectedNationality,
            decoration: UtilsTheme.textFormFieldDecoration(label: '????????*'),
            onChanged: controller.onNationalitySelected,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (final value) => Utils.validateText(value?.name),
            items: controller.nationalityItems
                .map((final items) =>
                DropdownMenuItem(
                  value: items,
                  child: Text(items.name),
                ))
                .toList()),
      );
}
