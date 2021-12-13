import 'package:cooking/src/pages/admin/ingredients/models/ingredients_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class IngredientsModifyController extends GetxController {
  GlobalKey<FormState> modifyMaterialFormKey = GlobalKey<FormState>();
  TextEditingController rawMaterial = TextEditingController();
  IngredientsViewModel? ingredientsViewModel;
  late String submitLabel;

  void submitTaped();

  void titleSaved(final String title);

  void unitSaved(final String unit);

  List<String> unitItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
}
