import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../../infrastructures/utils/utils_theme.dart';
import '../../../../shared/views/fill_button.dart';
import '../../../ingredients/models/ingredients_view_model.dart';
import '../../controllers/recipe_modify_base_controller.dart';
import '../../models/recipe_ingredients_view_model.dart';
import '../utils/recipe_utils.dart';

class RecipeModifyIngredient<T extends RecipeModifyBaseController>
    extends GetView<T> {
  const RecipeModifyIngredient({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _ingredient(),
          Utils.largeVerticalSpace,
          _ingredientCount(),
          FillButton(
            title: 'افزودن مواد اولیه',
            onPressed: controller.addIngredient,
          ),
          Utils.largeVerticalSpace,
          _items(),
        ],
      );

  Widget _ingredient() => Obx(
        () => controller.ingredientListLoading.value
            ? const CircularProgressIndicator()
            : DropdownButtonFormField<IngredientsViewModel>(
                key: controller.ingredientDropdownKey,
                value: controller.selectedIngredient,
                decoration:
                    UtilsTheme.textFormFieldDecoration(label: 'مواد اولیه'),
                onChanged: controller.onIngredientSelected,
                items: controller.ingredientsItems
                    .map((final items) => DropdownMenuItem(
                          value: items,
                          child: Text(items.title),
                        ))
                    .toList()),
      );

  Widget _ingredientCount() => TextFormField(
      controller: controller.ingredientCountTextController,
      keyboardType: TextInputType.number,
      decoration:
          UtilsTheme.textFormFieldDecoration(hint: 'مثال: 2', label: 'تعداد'));

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
    for (final element in controller.ingredientsList) {
      _optionsList.add(_optionBuilder(element));
    }
    return _optionsList;
  }

  Widget _optionBuilder(
          final RecipeIngredientsViewModel recipeIngredientsViewModel) =>
      Chip(
        label: Text('${recipeIngredientsViewModel.ingredientTitle ?? ' '} _ '
            '${recipeIngredientsViewModel.quantity}'),
        elevation: 5,
        deleteIcon: const Icon(
          Icons.close,
          size: 15,
        ),
        onDeleted: () => controller
            .removeIngredient(recipeIngredientsViewModel.ingredientId),
      );
}
