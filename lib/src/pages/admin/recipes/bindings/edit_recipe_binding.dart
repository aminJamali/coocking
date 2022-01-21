import 'package:get/get.dart';
import '../controllers/recipe_edit_controller.dart';

class EditRecipeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(RecipeEditController.new);  }

}