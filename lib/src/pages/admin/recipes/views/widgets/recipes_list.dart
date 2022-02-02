import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/routes/routes.dart';
import '../../../../../infrastructures/utils/utils.dart';
import '../../../../shared/views/advance_list_view.dart';
import '../../../../shared/views/dialogs/delete_dialog.dart';
import '../../controllers/recipe_controller.dart';
import '../../models/recipe_view_model.dart';
import 'recipes_list_item.dart';

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
                RecipesListItem(
                    recipeViewModel: item,
                    onEditTaped:()=> _onEditTaped(item.id),
                    onDeleteTaped: () => _deleteTaped(item.id)),
            emptyPageTitle: 'تاکنون دستور پختی ثبت نشده است.'),
      );

  Future<dynamic> _deleteTaped(final int recipeId) => Utils.showDialog(
        page: Obx(() => DeleteDialog(
              headerTitle: 'حذف دستور پخت',
              loading: controller.deleteLoading.value,
              bodyMessage: 'آیا دستور پخت انتخابی حذف شود؟',
              doneButtonTitle: 'حذف دستور پخت',
              onDeleteTaped: () => controller.deleteRecipe(recipeId),
            )),
      );

  void _onEditTaped(final int recipeId) => Get.toNamed(
      '${Routes.recipePage}${Routes.editRecipePage}',
      parameters: {'id': recipeId.toString()})?.then(_onDismissRegisterPage);

  void _onDismissRegisterPage(final recipeViewModel) {
    if (recipeViewModel != null) {
      controller.updateOnLocalList(recipeViewModel: recipeViewModel);
    }
  }
}
