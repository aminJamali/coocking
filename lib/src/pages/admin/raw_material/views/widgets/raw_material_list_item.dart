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
  Widget build(final BuildContext context) => ListTile(
    dense: true,
    tileColor: Colors.white,
    leading: const Icon(Icons.restaurant_outlined,),
        title: Text(rawMaterialViewModel.title),
        subtitle: Row(
          children: [
            Text(rawMaterialViewModel.count),
            Utils.smallHorizontalSpace,
            Text(rawMaterialViewModel.unit),
          ],
        ),
        trailing: SizedBox(
          width: context.width*0.3,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined),
                iconSize: 20,
              ),
              IconButton(
                onPressed: () {},
                iconSize: 20,
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
