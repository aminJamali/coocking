import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/utils.dart';
import '../models/recipe_documents_view_model.dart';
import '../models/recipe_full_view_model.dart';
import '../models/recipe_insert_dto.dart';
import '../models/recipe_view_model.dart';
import 'recipe_modify_base_controller.dart';

class RecipeEditController extends RecipeModifyBaseController {
  late int recipeId;
  RecipeFullViewModel? recipeFullViewModel;

  @override
  String get pageTitle => 'ویرایش دستور پخت';

  @override
  void onInit() async {
    if(Get.parameters['id']==null){
      Utils.errorToast(message: 'اطلاعات دستور پخت یافت نشد!');
      Get.back();
    }
    recipeId = int.parse(Get.parameters['id']!);
    await getRecipes();
    super.onInit();
  }

  Future<void> getRecipes() async {
    getInitLoading.value = true;
    final Either<String, RecipeFullViewModel> response =
        await recipeModifyRepository.getRecipe(recipeId: recipeId);
    response.fold(
      (final exception) => getInitLoading.value = false,
      (final result) async{
        recipeFullViewModel = result;
        await _init();
        getInitLoading.value = false;
      },
    );
  }

  Future<void> _init() async {
    await getCategory();
    await getNationality();
    await getIngredients();
    await getStepOperation();
    _fillInitValue();
  }

  void _fillInitValue() {
    foodNameTextController.text = recipeFullViewModel!.foodName;
    duration.value = recipeFullViewModel!.duration;
    for (final RecipeDocumentsViewModel element
        in recipeFullViewModel!.recipeDocuments) {
      documentsList.add(element.documentId);
    }

    if (categoryItems.isNotEmpty) {
      categoryListLoading.value=true;
      selectedCategory = categoryItems
          .where((final element) =>
              element.id == recipeFullViewModel!.recipeCategoryId)
          .first;
      categoryListLoading.value=false;
    }
    if (nationalityItems.isNotEmpty) {
      nationalityListLoading.value=true;
      selectedNationality = nationalityItems
          .where((final element) =>
              element.id == recipeFullViewModel!.nationalityId)
          .first;
      nationalityListLoading.value=false;
    }
    if (ingredientsItems.isNotEmpty) {
      ingredientsList.addAll(recipeFullViewModel!.recipeIngredients);
      ingredientsList
          .map((final element) => element.ingredientTitle = ingredientsItems
              .where(
                  (final ingredient) => ingredient.id == element.ingredientId)
              .first
              .title)
          .toList();
    }

    if (stepOperationItems.isNotEmpty) {
      operationsList.addAll(recipeFullViewModel!.recipeSteps);
      operationsList
          .map((final element) => element.stepOperationTitle =
              stepOperationItems
                  .where((final step) => step.id == element.stepOperationId)
                  .first
                  .title)
          .toList();
    }
  }

  @override
  void onSubmitTaped() {
    final bool isValidate = checkValidate();
    if (isValidate) {
      updateRecipe();
    }
  }

  Future<void> updateRecipe() async {
    submitLoading.value = true;
    final RecipeInsertDto recipeInsertDto = setRecipeInsertDto();

    final Either<String, String> result = await recipeModifyRepository
        .updateRecipe(recipeInsertDto: recipeInsertDto,recipeId: recipeId);
    result.fold((final exception) => submitLoading.value = false, (final id) {
      submitLoading.value = false;
      final RecipeViewModel finalRecipe = setFinalRecipeViewModel(recipeId);
      Get.back(result: finalRecipe);
      Utils.successToast(message: 'دستور پخت با موفقیت ویرایش گردید');
    });
  }
}
