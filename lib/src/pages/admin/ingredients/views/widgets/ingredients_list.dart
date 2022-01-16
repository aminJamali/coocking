import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../shared/views/advance_list_view.dart';
import '../../../../shared/views/dialogs/delete_dialog.dart';
import '../../controllers/ingredients_controller.dart';
import '../../controllers/ingredients_edit_controller.dart';
import '../../models/ingredients_view_model.dart';
import '../dialog/modify_ingredients_dialog.dart';
import 'ingredients_list_item.dart';

class IngredientsList extends GetView<IngredientsController> {
  const IngredientsList({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => _ingredientList();

  Widget _ingredientList() => Obx(
        () => AdvanceListView<IngredientsViewModel>(
            key: controller.paginationList.key,
            items: controller.paginationList.list,
            hasMoreData: controller.paginationList.hasMoreData.value,
            onRefreshData: controller.refreshIngredients,
            onLoadMoreData: controller.getAllIngredients,
            itemBuilder: (
              final context,
              final item,
              final index,
            ) =>
                IngredientsListItem(
                  ingredientsViewModel: item,
                  onEditTaped: () => _editTaped(item),
                  onDeleteTaped: () => _deleteTaped(item.id!),
                ),
            emptyPageTitle: 'تاکنون مواد اولیه ای ثبت نشده است.'),
      );

  Future<dynamic> _editTaped(final IngredientsViewModel ingredientsViewModel) =>
      Utils.showDialog(
        thenValue: (final item) {
          if (item != null) {
            controller.updateOnLocalList(ingredientsViewModel: item);
          }
        },
        page: ModifyIngredientsDialog(
            () => IngredientsEditController(ingredientsViewModel)),
      );

  Future<dynamic> _deleteTaped(final int ingredientsId) => Utils.showDialog(
        page: Obx(() => DeleteDialog(
              headerTitle: 'حذف ماده اولیه',
              loading: controller.deleteLoading.value,
              bodyMessage: 'آیا ماده اولیه انتخابی حذف شود؟',
              doneButtonTitle: 'حذف ماده اولیه',
              onDeleteTaped: () => controller.deleteIngredient(ingredientsId),
            )),
      );
}
