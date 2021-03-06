import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/utils.dart';
import '../../ingredients/models/ingredients_list_view_model.dart';
import '../../ingredients/models/ingredients_view_model.dart';
import '../../step_operations/models/step_operation_list_view_model.dart';
import '../../step_operations/models/step_operation_view_model.dart';
import '../models/recipe_category_view_model.dart';
import '../models/recipe_documents_dto.dart';
import '../models/recipe_ingredients_dto.dart';
import '../models/recipe_ingredients_view_model.dart';
import '../models/recipe_insert_dto.dart';
import '../models/recipe_nationality_list_view_model.dart';
import '../models/recipe_nationality_view_model.dart';
import '../models/recipe_steps_dto.dart';
import '../models/recipe_steps_view_model.dart';
import '../models/recipe_view_model.dart';
import '../repositories/recipe_modify_repository.dart';

abstract class RecipeModifyBaseController extends GetxController {
  final RecipeModifyRepository recipeModifyRepository =
      RecipeModifyRepository();

  String pageTitle = '';
  GlobalKey<FormState> modifyRecipeFormKey = GlobalKey<FormState>();
  TextEditingController foodNameTextController = TextEditingController();
  TextEditingController ingredientCountTextController = TextEditingController();
  TextEditingController stepDescriptionTextController = TextEditingController();
  GlobalKey<FormFieldState> ingredientDropdownKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> stepDropdownKey = GlobalKey<FormFieldState>();

  RxInt duration=0.obs;
  RxBool categoryListLoading = false.obs,
      nationalityListLoading = false.obs,
      ingredientListLoading = false.obs,
      stepOperationListLoading = false.obs,
  getInitLoading=false.obs,
  submitLoading=false.obs;

  RecipeCategoryViewModel? selectedCategory;
  List<RecipeCategoryViewModel> categoryItems = <RecipeCategoryViewModel>[];

  RecipeNationalityViewModel? selectedNationality;
  List<RecipeNationalityViewModel> nationalityItems =
      <RecipeNationalityViewModel>[];

  IngredientsViewModel? selectedIngredient;
  List<IngredientsViewModel> ingredientsItems = <IngredientsViewModel>[];

  StepOperationViewModel? selectedStepOperation;
  List<StepOperationViewModel> stepOperationItems = <StepOperationViewModel>[];

  RxList<RecipeIngredientsViewModel> ingredientsList =
      <RecipeIngredientsViewModel>[].obs;

  RxList<RecipeStepsViewModel> operationsList = <RecipeStepsViewModel>[].obs;

  RxList<String> documentsList = <String>[].obs;

  void onCategorySelected(final RecipeCategoryViewModel? category) {
    if (category == null) {
      return;
    }
    selectedCategory = category;
  }

  void onNationalitySelected(final RecipeNationalityViewModel? nationality) {
    if (nationality == null) {
      return;
    }
    selectedNationality = nationality;
  }

  void onIngredientSelected(final IngredientsViewModel? ingredient) {
    if (ingredient == null) {
      return;
    }
    selectedIngredient = ingredient;
  }

  void onStepOperationSelected(final StepOperationViewModel? stepOperation) {
    if (stepOperation == null) {
      return;
    }
    selectedStepOperation = stepOperation;
  }

  void addIngredient() {
    if (selectedIngredient == null) {
      Utils.errorToast(message: '???????? ?????????? ???????????? ???????? ??????');
      return;
    }
    final int ingredientCount =
        int.tryParse(ingredientCountTextController.text) ?? 0;
    if (ingredientCount < 1) {
      Utils.errorToast(message: '?????????? ???????? ?????????? ???????????? ???????? ??????');
      return;
    }

    final RecipeIngredientsViewModel recipeIngredientsViewModel =
        RecipeIngredientsViewModel(
      ingredientId: selectedIngredient!.id!,
      quantity: ingredientCount,
      ingredientTitle: selectedIngredient!.title,
    );
    selectedIngredient = null;
    ingredientCountTextController.clear();
    ingredientDropdownKey.currentState!.reset();
    ingredientsList.add(recipeIngredientsViewModel);
  }

  void removeIngredient(final int id) => ingredientsList
      .removeWhere((final element) => element.ingredientId == id);

  void addStepOperation() {
    if (selectedStepOperation == null) {
      Utils.errorToast(message: '?????????? ???? ???????????? ???????? ??????!');
      return;
    }
    if (stepDescriptionTextController.text.isEmpty) {
      Utils.errorToast(message: '?????????????? ?????? ?????????? ?????? ???????? ??????!');
      return;
    }

    final RecipeStepsViewModel recipeStepsViewModel = RecipeStepsViewModel(
      description: stepDescriptionTextController.text,
      order: 0,
      stepOperationId: selectedStepOperation!.id!,
      stepOperationTitle: selectedStepOperation!.title,
    );
    selectedStepOperation = null;
    stepDescriptionTextController.clear();
    stepDropdownKey.currentState!.reset();
    operationsList.add(recipeStepsViewModel);
  }

  void removeStepOperation(final int id) => operationsList
      .removeWhere((final element) => element.stepOperationId == id);

  void addDocuments(final String documentId) => documentsList.add(documentId);

  void removeDocuments(final String documentId) =>
      documentsList.removeWhere((final element) => element == documentId);

  Future<void> getCategory() async {
    categoryListLoading.value = true;
    final Either<String, List<RecipeCategoryViewModel>> response =
        await recipeModifyRepository.getCategory();
    response.fold(
      (final exception) {
        categoryListLoading.value = false;
      },
      (final categories) {
        categoryListLoading.value = false;
        categoryItems.addAll(categories);
      },
    );
  }

  Future<void> getNationality() async {
    nationalityListLoading.value = true;
    final Either<String, RecipeNationalityListViewModel> response =
        await recipeModifyRepository.getNationality(query: '');
    response.fold(
      (final exception) {
        nationalityListLoading.value = false;
      },
      (final nationality) {
        nationalityListLoading.value = false;
        nationalityItems.addAll(nationality.elements);
      },
    );
  }

  Future<void> getIngredients() async {
    ingredientListLoading.value = true;
    final Either<String, IngredientsListViewModel> response =
        await recipeModifyRepository.getAllIngredients(query: '');
    response.fold(
      (final exception) {
        ingredientListLoading.value = false;
      },
      (final result) {
        // paginationList.paginationOffset++;
        // if (result.elements!.isEmpty) {
        ingredientListLoading.value = false;
        // }
        //paginationList.key.currentState!.addAll(result.elements!);
        ingredientsItems.addAll(result.elements!);
      },
    );
  }

  Future<void> getStepOperation() async {
    stepOperationListLoading.value = true;
    final Either<String, StepOperationListViewModel> response =
        await recipeModifyRepository.getAllStepOperation(query: '');
    response.fold(
      (final exception) {
        stepOperationListLoading.value = false;
      },
      (final result) {
        // paginationList.paginationOffset++;
        // if (result.elements!.isEmpty) {
        stepOperationListLoading.value = false;
        // }
        //paginationList.key.currentState!.addAll(result.elements!);
        stepOperationItems.addAll(result.elements!);
      },
    );
  }

  bool checkValidate(){
    bool result=true;
    final bool isValidateForm= modifyRecipeFormKey.currentState!.validate();
    if(!isValidateForm){
      Utils.errorToast(message: '?????????????? ?????????? ???????? ??????!');
      result=false;
    }
    if(duration.value==0){
      Utils.errorToast(message: '???????? ?????? ???????? ???????? ??????!');
      result=false;
    }
    if(selectedCategory==null){
      Utils.errorToast(message: '???????? ???????? ?????? ???????? ???????? ??????!');
      result=false;
    }
    if(selectedNationality==null){
      Utils.errorToast(message: '???????? ???????? ???????? ??????!');
      result=false;
    }
    if(ingredientsList.isEmpty){
      Utils.errorToast(message: '???????? ?????????? ???????? ???????? ??????!');
      result=false;
    }
    if(operationsList.isEmpty){
      Utils.errorToast(message: '?????????? ?????? ???????? ???????? ??????!');
      result=false;
    }
    if(documentsList.isEmpty){
      Utils.errorToast(message: '???????????? ???????? ???????? ??????!');
      result=false;
    }
    return result;
  }

  void onSubmitTaped();

  RecipeViewModel setFinalRecipeViewModel(final int id) => RecipeViewModel(
    id: id,
    duration: duration.value,
    foodName: foodNameTextController.text,
    nationalityName: selectedNationality!.name,
    recipeCategoryTitle: selectedCategory!.title,
  );

  RecipeInsertDto setRecipeInsertDto() => RecipeInsertDto(
      foodName: foodNameTextController.text,
      duration: duration.value,
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
