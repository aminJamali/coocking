import 'package:cooking/src/pages/admin/ingredients/controllers/ingredients_modify_controller.dart';

class IngredientsRegisterController extends IngredientsModifyController{

  @override
  void onInit() {
    getUnits();
    super.onInit();
  }

  @override
  void submitTaped() {
    // TODO: implement submitTaped
  }

  @override
  void titleSaved(final String title) {
    // TODO: implement titleSaved
  }

  @override
  void unitSaved(final int unitId) {
    // TODO: implement unitSaved
  }
}