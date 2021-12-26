import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/pagination_list.dart';
import '../models/ingredients_list_view_model.dart';
import '../models/ingredients_view_model.dart';
import '../repositories/ingredients_repository.dart';

class IngredientsController extends GetxController {
  final IngredientsRepository _ingredientsRepository = IngredientsRepository();
  final PaginationList<IngredientsViewModel> paginationList = PaginationList();

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
       // if (result.elements!.isEmpty) {
          paginationList.hasMoreData.value = false;
        //}
        paginationList.key.currentState!.addAll(result.elements!);
        paginationList.paginationOffset++;
      },
    );
  }
}
