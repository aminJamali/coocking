import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/utils.dart';
import '../models/recipe_insert_dto.dart';
import '../models/recipe_view_model.dart';
import 'recipe_modify_base_controller.dart';

class RecipeRegisterController extends RecipeModifyBaseController {
  @override
  String get pageTitle => 'ثبت دستور پخت';

  @override
  void onInit() async {
    await _init();
    super.onInit();
  }

  Future<void> _init() async {
    getInitLoading.value=true;
    await getCategory();
    await getNationality();
    await getIngredients();
    await getStepOperation();
    getInitLoading.value=false;
  }

  @override
  void onSubmitTaped() {
    final bool isValidate = checkValidate();
    if (isValidate) {
      registerRecipe();
    }
  }

  Future<void> registerRecipe() async {
    submitLoading.value = true;
    final RecipeInsertDto recipeInsertDto = setRecipeInsertDto();

    final Either<String, int> result = await recipeModifyRepository
        .insertRecipe(recipeInsertDto: recipeInsertDto);
    result.fold((final exception) => submitLoading.value = false, (final id) {
      submitLoading.value = false;
      final RecipeViewModel finalRecipe = setFinalRecipeViewModel(id);
      Get.back(result: finalRecipe);
      Utils.successToast(message: 'دستور پخت با موفقیت ثبت گردید');
    });
  }


}
