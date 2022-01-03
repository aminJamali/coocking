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
  Widget build(final BuildContext context) => _ingredient();

  Widget _ingredient() => Card(
        color: Colors.white,
        shape: _border(),
        margin: Utils.middlePadding,
        elevation: Utils.smallSpace,
        child: Padding(
          padding: Utils.middlePadding,
          child: _item(),
        ),
      );

  Widget _item() => Row(
        children: [

          AdvanceNetworkImage(
            imageSize: 80,
            documentId: ingredientsViewModel.avatarId,
          ),
          Utils.largeHorizontalSpace,
          _details(),
          const Spacer(),
          _edit(),
          _delete(),
        ],
      );

  Widget _details() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ingredientsViewModel.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'واحد: ${ingredientsViewModel.ingredientUnitTitle ?? '-'}',
            style: TextStyle(color: Get.theme.disabledColor),
          )
        ],
      );

  Widget _delete() => IconButton(
        onPressed: onDeleteTaped,
        icon: Icon(
          Icons.delete_outlined,
          size: 30,
          color: Get.theme.errorColor,
        ),
      );

  Widget _edit() => IconButton(
        onPressed: onEditTaped,
        icon: Icon(
          Icons.edit_outlined,
          size: 30,
          color: Get.theme.colorScheme.primary,
        ),
      );

  RoundedRectangleBorder _border() => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(Utils.middleSpace)));
}
