import 'package:get/get.dart';
import '../controllers/recipe_register_controller.dart';

class RegisterRecipeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(RecipeRegisterController.new);  }

}