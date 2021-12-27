import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/pagination_list.dart';
import '../models/ingredients_list_view_model.dart';
import '../models/ingredients_view_model.dart';
import '../repositories/ingredients_repository.dart';

class IngredientsController extends GetxController {
  final IngredientsRepository _ingredientsRepository = IngredientsRepository();
  final PaginationList<IngredientsViewModel> paginationList = PaginationList();
  RxBool deleteLoading = false.obs;

  @override
  void onReady() {
    getAllIngredients();
    super.onReady();
  }

  Future<void> resetAndGetIngredients() async {
    resetIngredientsList();
    await getAllIngredients();
  }

  void resetIngredientsList() {
    if (paginationList.key.currentState != null) {
      paginationList.key.currentState!.clearAllItems();
    } else if (paginationList.list.isNotEmpty) {
      paginationList.list.clear();
    }
    paginationList.paginationOffset = 0;
  }

  Future<void> getAllIngredients() async {
    paginationList.hasMoreData.value = true;
    final Either<String, IngredientsListViewModel> response =
        await _ingredientsRepository.getAllIngredients(
            query: paginationList.query);
    response.fold(
      (final exception) {
        paginationList.hasMoreData.value = false;
      },
      (final result) {
        paginationList.paginationOffset++;
        if (result.elements!.isEmpty) {
          paginationList.hasMoreData.value = false;
        }
        paginationList.key.currentState!.addAll(result.elements!);
      },
    );
  }

  void addToLocalList(
          {required final IngredientsViewModel ingredientsViewModel}) =>
      paginationList.key.currentState!
          .addItem(ingredientsViewModel, atIndex: 0);

  void updateOnLocalList(
          {required final IngredientsViewModel ingredientsViewModel}) =>
      paginationList.key.currentState!.items
          .map((oldIngredient) => oldIngredient = ingredientsViewModel)
          .toList();

  Future<void> deleteIngredient(final int ingredientsId) async {
    deleteLoading.value = true;
    final Either<String, String> response = await _ingredientsRepository
        .deleteIngredient(ingredientId: ingredientsId);
    response.fold(
      (final exception) {
        deleteLoading.value = false;
      },
      (final result) {
        removeOnLocalList(ingredientsId: ingredientsId);
        deleteLoading.value = false;
        Get.back();
      },
    );
  }

  void removeOnLocalList({required final int ingredientsId}) {
    final int _index = paginationList.key.currentState!.items
        .indexWhere((final element) => element.id == ingredientsId);
    paginationList.key.currentState!.removeItemAt(_index);

  }
}
