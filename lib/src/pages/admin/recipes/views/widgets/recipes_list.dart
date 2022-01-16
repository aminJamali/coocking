import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../shared/views/advance_list_view.dart';
import '../../../../shared/views/dialogs/delete_dialog.dart';
import '../../controllers/recipe_controller.dart';
import '../../models/recipe_view_model.dart';

class RecipesList extends GetView<RecipeController> {
  const RecipesList({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => _recipesList();
  Widget _recipesList() => Obx(
        () => AdvanceListView<RecipeViewModel>(
        key: controller.paginationList.key,
        items: controller.paginationList.list,
        hasMoreData: controller.paginationList.hasMoreData.value,
        onRefreshData: controller.refreshRecipe,
        onLoadMoreData: controller.getAllRecipes,
        itemBuilder: (
            final context,
            final item,
            final index,
            ) =>
             Text(item.foodName),
        emptyPageTitle: 'تاکنون دستور پختی ثبت نشده است.'),
  );

  Future<dynamic> _deleteTaped(final int ingredientsId) => Utils.showDialog(
    page: Obx(() => DeleteDialog(
      headerTitle: 'حذف دستور پخت',
     // loading: controller.deleteLoading.value,
      bodyMessage: 'آیا دستور پخت انتخابی حذف شود؟',
      doneButtonTitle: 'حذف دستور پخت',
      onDeleteTaped: () => {},
      // onDeleteTaped: () => controller.deleteIngredient(ingredientsId),
    )),
  );

}
