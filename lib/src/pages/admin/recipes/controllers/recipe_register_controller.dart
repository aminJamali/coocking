import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/utils.dart';
import '../models/recipe_documents_dto.dart';
import '../models/recipe_ingredients_dto.dart';
import '../models/recipe_ingredients_view_model.dart';
import '../models/recipe_insert_dto.dart';
import '../models/recipe_steps_dto.dart';
import '../models/recipe_steps_view_model.dart';
import '../models/recipe_view_model.dart';
import 'recipe_modify_base_controller.dart';

class RecipeRegisterController extends RecipeModifyBaseController {
  @override
  String get pageTitle => 'ثبت دستور پخت';

  @override
  void onInit() async {
    await getCategory();
    await getNationality();
    await getIngredients();
    await getStepOperation();
    super.onInit();
  }

  @override
  void onSubmitTaped() {
    final bool isValidate = checkValidate();
    if (isValidate) {}
  }

  Future<void> registerRecipe() async {
    submitLoading.value = true;
    final RecipeInsertDto recipeInsertDto = _setRecipeInsertDto();

    final Either<String, int> result = await recipeModifyRepository
        .insertRecipe(recipeInsertDto: recipeInsertDto);
    result.fold((final exception) => submitLoading.value = false, (final id) {
      submitLoading.value = false;
      final RecipeViewModel finalRecipe = _setFinalRecipeViewModel(id);
      Get.back(result: finalRecipe);
      Utils.successToast(message: 'دستور پخت با موفقیت ثبت گردید');
    });
  }

  RecipeViewModel _setFinalRecipeViewModel(final int id) => RecipeViewModel(
        id: id,
        duration: duration!,
        foodName: foodNameTextController.text,
        nationalityName: selectedNationality!.name,
        recipeCategoryTitle: selectedCategory!.title,
      );

  RecipeInsertDto _setRecipeInsertDto() => RecipeInsertDto(
      foodName: foodNameTextController.text,
      duration: duration!,
      recipeCategoryId: selectedCategory!.id,
      nationalityId: selectedNationality!.id,
      recipeIngredients: _setRecipeIngredientsDto(),
      recipeDocuments: _setRecipeDocumentsDto(),
      recipeSteps: _setRecipeStepsDto());

  List<RecipeIngredientsDto> _setRecipeIngredientsDto() {
    final List<RecipeIngredientsDto> _recipeIngredientsDtoList =
        <RecipeIngredientsDto>[];

    for (final RecipeIngredientsViewModel element in ingredientsList) {
      final RecipeIngredientsDto _recipeIngredientsDto = RecipeIngredientsDto(
        quantity: element.quantity,
        ingredientId: element.ingredientId,
      );
      _recipeIngredientsDtoList.add(_recipeIngredientsDto);
    }

    return _recipeIngredientsDtoList;
  }

  List<RecipeDocumentsDto> _setRecipeDocumentsDto() {
    final List<RecipeDocumentsDto> _recipeDocumentsDtoList =
        <RecipeDocumentsDto>[];

    for (final String element in documentsList) {
      final RecipeDocumentsDto _recipeIngredientsDto = RecipeDocumentsDto(
        documentId: element,
        extension: 'jpg',
      );
      _recipeDocumentsDtoList.add(_recipeIngredientsDto);
    }

    return _recipeDocumentsDtoList;
  }

  List<RecipeStepsDto> _setRecipeStepsDto() {
    final List<RecipeStepsDto> _recipeStepsDtoList = <RecipeStepsDto>[];
    int _order = 0;
    for (final RecipeStepsViewModel element in operationsList) {
      final RecipeStepsDto _recipeIngredientsDto = RecipeStepsDto(
        stepOperationId: element.stepOperationId,
        description: element.description,
        order: _order,
      );
      _recipeStepsDtoList.add(_recipeIngredientsDto);
      _order++;
    }

    return _recipeStepsDtoList;
  }
}
