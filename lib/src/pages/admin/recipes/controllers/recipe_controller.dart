import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/pagination_list.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../models/recipe_list_view_model.dart';
import '../models/recipe_view_model.dart';
import '../repositories/recipe_repository.dart';

class RecipeController extends GetxController {
  final RecipeRepository _recipeRepository = RecipeRepository();
  final PaginationList<RecipeViewModel> paginationList = PaginationList();
  RxBool deleteLoading = false.obs;

  @override
  void onReady() {
    getAllRecipes();
    super.onReady();
  }

  Future<void> refreshRecipe() async {
    resetRecipeList();
    await getAllRecipes();
  }

  void resetRecipeList() {
    if (paginationList.key.currentState != null) {
      paginationList.key.currentState!.clearAllItems();
    } else if (paginationList.list.isNotEmpty) {
      paginationList.list.clear();
    }
    paginationList.paginationOffset = 0;
  }

  Future<void> getAllRecipes() async {
    paginationList.hasMoreData.value = true;
    final Either<String, RecipeListViewModel> response =
        await _recipeRepository.getAllRecipes(query: paginationList.query);
    response.fold(
      (final exception) {
        paginationList.hasMoreData.value = false;
      },
      (final result) {
        paginationList.paginationOffset++;
        if (result.elements.isEmpty) {
          paginationList.hasMoreData.value = false;
        }
        paginationList.key.currentState!.addAll(result.elements);
      },
    );
  }

  void addToLocalList({required final RecipeViewModel recipeViewModel}) =>
      paginationList.key.currentState!.addItem(recipeViewModel, atIndex: 0);

  void updateOnLocalList({required final RecipeViewModel recipeViewModel}) {
    removeOnLocalList(recipeId: recipeViewModel.id);
    addToLocalList(recipeViewModel: recipeViewModel);
  }

  Future<void> deleteRecipe(final int recipeId) async {
    deleteLoading.value = true;
    final Either<String, String> response =
        await _recipeRepository.deleteRecipe(recipeId: recipeId);
    response.fold(
      (final exception) {
        deleteLoading.value = false;
      },
      (final result) {
        removeOnLocalList(recipeId: recipeId);
        deleteLoading.value = false;
        Get.back();
        Utils.successToast(message: 'دستور پخت با موفقیت حذف گردید');
      },
    );
  }

  void removeOnLocalList({required final int recipeId}) {
    final int _index = paginationList.key.currentState!.items
        .indexWhere((final element) => element.id == recipeId);
    paginationList.key.currentState!.removeItemAt(_index);
  }
}
