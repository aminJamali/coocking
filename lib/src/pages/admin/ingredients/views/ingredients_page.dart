import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/utils.dart';
import '../controllers/ingredients_controller.dart';
import '../controllers/ingredients_register_controller.dart';
import 'dialog/modify_ingredients_dialog.dart';
import 'widgets/ingredients_list.dart';

class IngredientsPage extends StatelessWidget {
  final controller = Get.put(IngredientsController());

  IngredientsPage({final Key? key}) : super(key: key);

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
            child: const IngredientsList(),
          ),
        ),
      );

  Widget _addButton() => FloatingActionButton(
        onPressed: _onAddTaped,
        child: const Icon(Icons.add),
      );

  Future<dynamic> _onAddTaped() => Utils.showDialog(
        thenValue: (final result) {
          if (result) {
            return controller.resetAndGetIngredients();
          }
        },
        page: ModifyIngredientsDialog(
          () => IngredientsRegisterController(),
        ),
      );
}
