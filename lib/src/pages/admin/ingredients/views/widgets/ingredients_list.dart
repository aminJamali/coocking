import 'package:cooking/src/pages/admin/ingredients/controllers/ingredients_controller.dart';
import 'package:cooking/src/pages/admin/ingredients/models/ingredients_view_model.dart';
import 'package:cooking/src/pages/shared/views/advance_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ingredients_list_item.dart';

class IngredientsList extends GetView<IngredientsController> {
  const IngredientsList({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Obx(
        () => AdvanceListView<IngredientsViewModel>(
            key: controller.paginationList.key,
            items: controller.paginationList.list,
            hasMoreData: controller.paginationList.hasMoreData.value,
            onRefreshData: controller.resetAndGetIngredients,
            onLoadMoreData: controller.getAllIngredients,
            itemBuilder: (
              final context,
              final item,
              final index,
            ) =>
                IngredientsListItem(
                  ingredientsViewModel: item,
                ),
            emptyPageTitle: 'تاکنون مواد اولیه ای ثبت نشده است.'),
      );
}
