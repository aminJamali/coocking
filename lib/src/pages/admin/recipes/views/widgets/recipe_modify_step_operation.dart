import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../../infrastructures/utils/utils_theme.dart';
import '../../../../shared/views/fill_button.dart';
import '../../../step_operations/models/step_operation_view_model.dart';
import '../../controllers/recipe_modify_base_controller.dart';
import '../../models/recipe_steps_view_model.dart';
import '../utils/recipe_utils.dart';

class RecipeModifyStepOperation<T extends RecipeModifyBaseController>
    extends GetView<T> {
  const RecipeModifyStepOperation({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _stepOperation(),
          Utils.largeVerticalSpace,
          _stepDescription(),
          FillButton(
            title: 'افزودن مرحله',
            onPressed: controller.addStepOperation,
          ),
          Utils.largeVerticalSpace,
          _items(),
        ],
      );

  Widget _stepOperation() => Obx(
        () => controller.stepOperationListLoading.value
            ? const CircularProgressIndicator()
            : DropdownButtonFormField<StepOperationViewModel>(
                key: controller.stepDropdownKey,
                value: controller.selectedStepOperation,
                decoration:
                    UtilsTheme.textFormFieldDecoration(label: 'مراحل پخت*'),
                onChanged: controller.onStepOperationSelected,
                validator: (final value) => Utils.validateText(value?.title),
                items: controller.stepOperationItems
                    .map((final items) => DropdownMenuItem(
                          value: items,
                          child: Text(items.title!),
                        ))
                    .toList()),
      );

  Widget _stepDescription() => TextFormField(
      controller: controller.stepDescriptionTextController,
      validator: Utils.validateText,
      decoration: UtilsTheme.textFormFieldDecoration(label: 'توضیحات*'));

  Widget _items() => Container(
        width: Get.width,
        height: 80,
        decoration: RecipeUtils.itemDecoration(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: Utils.middlePadding,
            child: Obx(() => Wrap(
                spacing: Utils.smallSpace,
                runSpacing: Utils.middleSpace,
                direction: Axis.vertical,
                children: _buildItems())),
          ),
        ),
      );

  List<Widget> _buildItems() {
    final List<Widget> _optionsList = [];
    for (final element in controller.operationsList) {
      _optionsList.add(_optionBuilder(element));
    }
    return _optionsList;
  }

  Widget _optionBuilder(final RecipeStepsViewModel recipeStepsViewModel) =>
      Chip(
        label: Text(
          '${recipeStepsViewModel.stepOperationTitle ?? ' '} _ '
          '${recipeStepsViewModel.description}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        elevation: 5,
        deleteIcon: const Icon(
          Icons.close,
          size: 15,
        ),
        onDeleted: () => controller
            .removeStepOperation(recipeStepsViewModel.stepOperationId),
      );
}
