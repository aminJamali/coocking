import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/utils.dart';
import 'ingredients_modify_controller.dart';

class IngredientsRegisterController extends IngredientsModifyController {
  @override
  void onInit() {
    getUnits();
    super.onInit();
  }

  @override
  void submitTaped() {
    if (modifyMaterialFormKey.currentState!.validate()) {
      modifyMaterialFormKey.currentState!.save();
      registerIngredient();
    }
  }

  Future<void> registerIngredient() async {
    loadingSubmit.value = true;
    final Either<String, String> result = await modifyIngredientsRepository
        .setIngredient(ingredientsDto: ingredientsDto);
    result.fold((final exception) => loadingSubmit.value = false,
        (final result) {
      loadingSubmit.value = false;
      Get.back(result: true);
      Utils.successToast(message: 'مواد اولیه با موفقیت ثبت گردید');
    });
  }
}
