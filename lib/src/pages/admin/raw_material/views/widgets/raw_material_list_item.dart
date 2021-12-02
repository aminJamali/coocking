import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/utils.dart';
import '../../models/raw_material_view_model.dart';

class RawMaterialListItem extends StatelessWidget {
  final RawMaterialViewModel rawMaterialViewModel;

  const RawMaterialListItem({
    required final this.rawMaterialViewModel,
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
          leading: Icon(
            Icons.restaurant_rounded,
            color: Get.theme.colorScheme.primary,
          ),
          title: Text(rawMaterialViewModel.title),
          subtitle: Row(
            children: [
              Text(rawMaterialViewModel.count),
              Utils.smallHorizontalSpace,
              Text(rawMaterialViewModel.unit),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
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
}
