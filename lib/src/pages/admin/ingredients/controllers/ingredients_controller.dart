import 'package:cooking/src/pages/admin/ingredients/models/ingredients_list_view_model.dart';
import 'package:cooking/src/pages/admin/ingredients/repositories/ingredients_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class IngredientsController extends GetxController{
  final IngredientsRepository _ingredientsRepository = IngredientsRepository();
  @override
  void onInit() {
    getAllIngredients();
    super.onInit();
  }

  Future<void> getAllIngredients() async {
    //assessorInformationLoading.value = true;
    final Either<String, IngredientsListViewModel> response =
    await _ingredientsRepository.getAllIngredients(
    );
    response.fold(
          (final exception) {
       // assessorInformationLoading.value = false;
      },
          (final result) {
      //  assessorInformationLoading.value = false;

      },
    );
  }
}