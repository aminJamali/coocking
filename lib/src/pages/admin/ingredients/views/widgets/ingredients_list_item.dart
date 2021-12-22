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
        child: ListTile(
          dense: true,
          tileColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(Utils.middleSpace))),
          leading: AdvanceNetworkImage(documentId: ingredientsViewModel.avatarId,),
          title: Text(ingredientsViewModel.title),
          subtitle: Row(
            children: [
              Text(ingredientsViewModel.title),
              Utils.smallHorizontalSpace,
              Text(ingredientsViewModel.ingredientUnitTitle ?? '-'),
            ],
          ),
          trailing: Row(
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
          ),
        ),
      );

  Future<dynamic> _editTaped() => Utils.showDialog(
        page: ModifyIngredientsDialog(() => IngredientsEditController()),
      );
}
