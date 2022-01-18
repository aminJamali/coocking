import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/recipe_category_view_model.dart';
import '../models/recipe_nationality_list_view_model.dart';
import '../models/recipe_nationality_view_model.dart';
import '../repositories/recipe_modify_repository.dart';

class RecipeModifyBaseController extends GetxController {
  final RecipeModifyRepository _recipeModifyRepository =
      RecipeModifyRepository();

  String pageTitle = '';
  GlobalKey<FormState> modifyRecipeFormKey = GlobalKey<FormState>();
  int? duration;
  RxBool categoryListLoading = false.obs, nationalityListLoading = false.obs;
  RecipeCategoryViewModel? selectedCategory;
  List<RecipeCategoryViewModel> categoryItems = <RecipeCategoryViewModel>[];
  RecipeNationalityViewModel? selectedNationality;
  List<RecipeNationalityViewModel> nationalityItems =
      <RecipeNationalityViewModel>[];

  void onCategorySelected(final RecipeCategoryViewModel? category) {
    if (category == null) {
      return;
    }
    selectedCategory = category;
    // ingredientsDto.ingredientUnitId = category.id;
  }

  void onNationalitySelected(final RecipeNationalityViewModel? nationality) {
    if (nationality == null) {
      return;
    }
    selectedNationality = nationality;
    // ingredientsDto.ingredientUnitId = category.id;
  }

  Future<void> getCategory() async {
    categoryListLoading.value = true;
    final Either<String, List<RecipeCategoryViewModel>> response =
        await _recipeModifyRepository.getCategory();
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
        await _recipeModifyRepository.getNationality(query: '');
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
}
