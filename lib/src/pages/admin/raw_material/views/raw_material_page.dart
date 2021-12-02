import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/pages/admin/raw_material/models/raw_material_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/empty_page.dart';
import 'dialog/raw_material_dialog.dart';
import 'widgets/raw_material_list_item.dart';

class RawMaterialPage extends StatelessWidget {
  const RawMaterialPage({final Key? key}) : super(key: key);

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
            child: RawMaterialListItem(
              rawMaterialViewModel: RawMaterialViewModel(
                  id: '', unit: 'گرم', count: '10', title: 'گوجه فرنگی'),
            ),
          ),
        ),
        // body: const EmptyPage(
        //       title: 'تاکنون مواد اولیه ای ثبت نشده است.',
        //     ),
      );

  Widget _addButton() => FloatingActionButton(
        onPressed: () {
          Get.dialog(RawMaterialDialog(), barrierColor: Colors.white10);
        },
        child: const Icon(Icons.add),
      );
}
