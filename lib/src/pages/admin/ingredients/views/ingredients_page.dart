import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/pages/admin/ingredients/controllers/ingredients_register_controller.dart';
import 'package:cooking/src/pages/admin/ingredients/models/ingredients_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/views/empty_page.dart';
import 'dialog/modify_ingredients_dialog.dart';
import 'widgets/ingredients_list_item.dart';

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({final Key? key}) : super(key: key);

  @override
  @override
  Widget build(final BuildContext context) => Scaffold(
        floatingActionButton: _addButton(),
        appBar: AppBar(
          title: const Text('مواد اولیه'),
          centerTitle: true,
          excludeHeaderSemantics: true,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: Utils.maxWith),
            child: IngredientsListItem(
              ingredientsViewModel: IngredientsViewModel(
                  title: 'گوجه فرنگی', ingredientUnitTitle: 'گرم'),
            ),
          ),
        ),
        // body: const EmptyPage(
        //       title: 'تاکنون مواد اولیه ای ثبت نشده است.',
        //     ),
      );

  Widget _addButton() => FloatingActionButton(
        onPressed: _onAddTaped,
        child: const Icon(Icons.add),
      );

  Future<dynamic> _onAddTaped() => Utils.showDialog(
        page: ModifyIngredientsDialog(() => IngredientsRegisterController()),
      );
}
