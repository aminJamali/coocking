import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../../../shared/views/advance_network_image.dart';
import '../../models/ingredients_view_model.dart';

class IngredientsListItem extends StatelessWidget {
  final IngredientsViewModel ingredientsViewModel;
  final void Function()? onEditTaped;
  final void Function()? onDeleteTaped;

  const IngredientsListItem({
    required final this.ingredientsViewModel,
    final Key? key,
   final this.onEditTaped,
   final this.onDeleteTaped,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Padding(
        padding: Utils.middlePadding,
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
          _edit(),
          _delete(),
        ],
      );

  Widget _delete() => IconButton(
          onPressed: onDeleteTaped,
          icon: Icon(
            Icons.delete_outlined,
            color: Get.theme.errorColor,
          ),
        );

  Widget _edit() => IconButton(
          onPressed: onEditTaped,
          icon: Icon(
            Icons.edit_outlined,
            color: Get.theme.colorScheme.primary,
          ),
        );

  RoundedRectangleBorder _border() => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(Utils.middleSpace)));
}
