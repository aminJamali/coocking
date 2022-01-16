import 'package:get/get.dart';

import '../controllers/recipe_controller.dart';
import '../controllers/recipe_edit_controller.dart';
import '../controllers/recipe_register_controller.dart';

class RecipeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(RecipeController.new);
    Get.lazyPut(RecipeRegisterController.new);
    Get.lazyPut(RecipeEditController.new);
  }

}