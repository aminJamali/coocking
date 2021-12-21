import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/ingredient_units_list_view_model.dart';
import '../models/ingredient_units_view_model.dart';
import '../models/ingredients_view_model.dart';
import '../repositories/modify_ingredients_repository.dart';

abstract class IngredientsModifyController extends GetxController {
  final ModifyIngredientsRepository _modifyIngredientsRepository =
      ModifyIngredientsRepository();
  GlobalKey<FormState> modifyMaterialFormKey = GlobalKey<FormState>();
  TextEditingController rawMaterial = TextEditingController();
  IngredientsViewModel? ingredientsViewModel;
  RxBool loadingSubmit = false.obs, unitListLoading = false.obs;

  void submitTaped();

  void titleSaved(final String title);

  void unitSaved(final int unitId);

  List<IngredientUnitsViewModel> unitItems = <IngredientUnitsViewModel>[];

  Future<void> getUnits() async {
    unitListLoading.value = true;
    final Either<String, IngredientUnitsListViewModel> response =
        await _modifyIngredientsRepository.getIngredientsUnit(query: '');
    response.fold(
      (final exception) => unitListLoading.value = false,
      (final result) {
        unitListLoading.value = false;
        unitItems.addAll(result.elements!);
      },
    );
  }
}
