import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../shared/views/advance_network_image.dart';
import '../../controllers/ingredients_edit_controller.dart';
import '../../models/ingredients_view_model.dart';
import '../dialog/modify_ingredients_dialog.dart';

class IngredientsListItem extends StatelessWidget {
  final IngredientsViewModel ingredientsViewModel;

  const IngredientsListItem({
    required final this.ingredientsViewModel,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Padding(
        padding: Utils.middlePadding,
        // child: Container(
        //     color: Colors.red,
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(ingredientsViewModel.title),
        //     )),
         child: _ingredient(),
      );

  Widget _ingredient() => ListTile(
        tileColor: Colors.white,
        shape: _border(),
        leading: AdvanceNetworkImage(
          documentId: ingredientsViewModel.avatarId,
        ),
       title: Text(ingredientsViewModel.title),
        subtitle: Row(
          children: [
            const Text('واحد: '),
            Text(ingredientsViewModel.ingredientUnitTitle ?? '-'),
          ],
        ),
        trailing: _buttons(),
      );

  Widget _buttons() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: _editTaped,
            icon: Icon(
              Icons.edit_outlined,
              color: Get.theme.colorScheme.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_outlined,
              color: Get.theme.errorColor,
            ),
          ),
        ],
      );

  RoundedRectangleBorder _border() => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(Utils.middleSpace)));

  Future<dynamic> _editTaped() => Utils.showDialog(
        page: ModifyIngredientsDialog(
            () => IngredientsEditController(ingredientsViewModel)),
      );
}
