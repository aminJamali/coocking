import 'recipe_modify_base_controller.dart';

class RecipeEditController extends RecipeModifyBaseController{
  @override
  String get pageTitle => 'ویرایش دستور پخت';

  @override
  void onSubmitTaped() {
    final bool isValidate=checkValidate();
    if(isValidate){

    }
  }

}