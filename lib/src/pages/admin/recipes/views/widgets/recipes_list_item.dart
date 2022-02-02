import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../models/recipe_view_model.dart';

class RecipesListItem extends StatelessWidget {
  final RecipeViewModel recipeViewModel;
  final void Function() onEditTaped;
  final void Function() onDeleteTaped;

  const RecipesListItem({
    required final this.recipeViewModel,
    required final this.onEditTaped,
    required final this.onDeleteTaped,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => _recipe();

  Widget _recipe() => Card(
        color: Colors.white,
        shape: _border(),
        margin: Utils.middlePadding,
        elevation: Utils.smallSpace,
        child: Padding(
          padding: Utils.middlePadding,
          child: _item(),
        ),
      );

  Widget _item() => IntrinsicHeight (
    child: Row(
          children: [
            Utils.middleHorizontalSpace,
            _foodNameAndNationality(),
            Utils.middleHorizontalSpace,
            const VerticalDivider(
              thickness: 2,
            ),
            Utils.middleHorizontalSpace,
            _details(),
            const Spacer(),
            _edit(),
            _delete(),
          ],
        ),
  );

  Widget _foodNameAndNationality() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            recipeViewModel.foodName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            recipeViewModel.nationalityName,
            style: TextStyle(
              fontSize: 12,
              color: Get.theme.disabledColor,
            ),
          ),
        ],
      );

  Widget _details() {
    final String _duration =
        Utils.convertDurationToTime(recipeViewModel.duration);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              Icons.category,
              color: Get.theme.colorScheme.primary,
            ),
            Utils.smallHorizontalSpace,
            Text('دسته بندی: ${recipeViewModel.recipeCategoryTitle}'),
          ],
        ),
        Utils.middleVerticalSpace,
        Row(
          children: [
            Icon(
              Icons.timer,
              color: Get.theme.colorScheme.primary,
            ),
            Utils.smallHorizontalSpace,
            Text(
              'زمان پخت: $_duration',
            ),
          ],
        )
      ],
    );
  }

  Widget _delete() => IconButton(
        onPressed: onDeleteTaped,
        icon: Icon(
          Icons.delete_outlined,
          size: 30,
          color: Get.theme.errorColor,
        ),
      );

  Widget _edit() => IconButton(
        onPressed: onEditTaped,
        icon: Icon(
          Icons.edit_outlined,
          size: 30,
          color: Get.theme.colorScheme.primary,
        ),
      );

  RoundedRectangleBorder _border() => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(Utils.middleSpace)));
}
