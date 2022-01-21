import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/ingredient_units_list_view_model.dart';
import '../models/ingredient_units_view_model.dart';
import '../models/ingredients_dto.dart';
import '../models/ingredients_view_model.dart';
import '../repositories/ingredients_modify_repository.dart';

<<<<<<< HEAD:lib/src/pages/admin/ingredients/controllers/ingredients_modify_controller.dart
abstract class IngredientsModifyController extends GetxController {
  final ModifyIngredientsRepository modifyIngredientsRepository =
      ModifyIngredientsRepository();
=======
abstract class IngredientsModifyBaseController extends GetxController {
  final IngredientsModifyRepository modifyIngredientsRepository =
      IngredientsModifyRepository();
>>>>>>> 907fb3fe78f037b0e237874bc1cc0871f5ffd466:lib/src/pages/admin/ingredients/controllers/ingredients_modify_base_controller.dart
  GlobalKey<FormState> modifyMaterialFormKey = GlobalKey<FormState>();
  TextEditingController rawMaterial = TextEditingController();
  IngredientsViewModel? ingredientsViewModel;
  IngredientsDto ingredientsDto =
      IngredientsDto(ingredientUnitId: 0, title: '');
  RxBool loadingSubmit = false.obs, unitListLoading = false.obs;
  IngredientUnitsViewModel? selectedUnit;

  void submitTaped();

  List<IngredientUnitsViewModel> unitItems = <IngredientUnitsViewModel>[];

  Future<bool> getUnits() async {
    bool result = false;
    unitListLoading.value = true;
    final Either<String, IngredientUnitsListViewModel> response =
        await modifyIngredientsRepository.getIngredientsUnit(query: '');
    response.fold(
      (final exception) {
        unitListLoading.value = false;
        result = false;
      },
      (final units) {
        unitListLoading.value = false;
        unitItems.addAll(units.elements!);
        result = true;
      },
    );
    return result;
  }

  void onUnitSelected(final IngredientUnitsViewModel? unit) {
    if (unit == null) {
      return;
    }
    selectedUnit = unit;
    ingredientsDto.ingredientUnitId = unit.id;
  }
}
