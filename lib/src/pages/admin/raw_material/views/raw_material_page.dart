import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/empty_page.dart';
import 'dialog/raw_material_dialog.dart';

class RawMaterialPage extends StatelessWidget {
  const RawMaterialPage({final Key? key}) : super(key: key);

  @override
  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: context.theme.backgroundColor,
        floatingActionButton: _addButton(),
        // body: RawMaterialListItem(
        //   rawMaterialViewModel: RawMaterialViewModel(
        //       id: '', unit: 'گرم', count: '10', title: 'گوجه فرنگی'),
        // ),
        body: const EmptyPage(
              title: 'تاکنون مواد اولیه ای ثبت نشده است.',
            ),
      );

  Widget _addButton() => FloatingActionButton(
        onPressed: () {
          Get.dialog(RawMaterialDialog(), barrierColor: Colors.white10);
        },
        child: const Icon(Icons.add),
      );
}
