import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/routes/routes.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../controllers/recipe_controller.dart';
import 'widgets/recipes_list.dart';

class RecipePage extends GetView<RecipeController> {
  const RecipePage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: _addButton(),
        appBar: _appBar(),
        body: _body(),
      );

  Widget _addButton() => FloatingActionButton(
        onPressed: _onRegisterTaped,
        child: const Icon(Icons.add),
      );

  void _onRegisterTaped() => Get.toNamed(
        '${Routes.recipePage}${Routes.registerRecipePage}',
      )?.then(_onDismissRegisterPage);

  void _onDismissRegisterPage(final recipeViewModel) {
    if (recipeViewModel != null) {
      controller.addToLocalList(recipeViewModel: recipeViewModel);
    }
  }

  AppBar _appBar() => AppBar(
        title: const Text('دستور پخت'),
        centerTitle: true,
        excludeHeaderSemantics: true,
      );

  Widget _body() => Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Utils.maxWith),
          child: const RecipesList(),
        ),
      );
}
