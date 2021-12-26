import '../models/ingredients_view_model.dart';
import 'ingredients_modify_controller.dart';

class IngredientsEditController extends IngredientsModifyController {
  IngredientsEditController(this.initIngredientViewModel);

  IngredientsViewModel initIngredientViewModel;

  @override
  void onInit() {
    ingredientsViewModel = initIngredientViewModel;
    getUnits().then((final result) {
      if (result) {
        _setInitUnit();
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
    // TODO: implement submitTaped
  }
}
