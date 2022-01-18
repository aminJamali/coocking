import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/utils.dart';
import '../models/ingredients_view_model.dart';
import 'ingredients_modify_base_controller.dart';

class IngredientsEditController extends IngredientsModifyBaseController {
  IngredientsEditController(this.initIngredientViewModel);

  IngredientsViewModel initIngredientViewModel;

  @override
  void onInit() {
    ingredientsViewModel = initIngredientViewModel;
    getUnits().then((final result) {
      if (result) {
        _setInitUnit();
        ingredientsDto = initIngredientViewModel.convertToDto(selectedUnit!.id);
      }
    });
    super.onInit();
  }

  void _setInitUnit() {
    selectedUnit = unitItems
        .where((final element) =>
            element.title == initIngredientViewModel.ingredientUnitTitle)
        .first;
  }

  @override
  void submitTaped() {
    if (modifyMaterialFormKey.currentState!.validate()) {
      if (ingredientsDto.avatarId != null) {
      modifyMaterialFormKey.currentState!.save();
      registerIngredient();
      }else{
        Utils.errorToast(message: 'انتخاب تصویر اجباری می باشد!');
      }
    }
  }

  Future<void> registerIngredient() async {
    loadingSubmit.value = true;
    final Either<String, String> result =
        await modifyIngredientsRepository.editIngredient(
            ingredientsDto: ingredientsDto,
            ingredientId: initIngredientViewModel.id!);
    result.fold((final exception) => loadingSubmit.value = false,
        (final result) {
      loadingSubmit.value = false;
      _onSuccess();
    });
  }

  void _onSuccess() {
    final IngredientsViewModel _finalIngredient =
        ingredientsDto.convertToViewModel(
            id: initIngredientViewModel.id!, unitTitle: selectedUnit!.title);
    Get.back(result: _finalIngredient);
    Utils.successToast(message: 'مواد اولیه با موفقیت ویرایش گردید');
  }
}
