import 'recipe_modify_base_controller.dart';

class RecipeRegisterController extends RecipeModifyBaseController {
  @override
  String get pageTitle => 'ثبت دستور پخت';

  @override
  void onInit() async{
   await getCategory();
   await getNationality();
    super.onInit();
  }
}
