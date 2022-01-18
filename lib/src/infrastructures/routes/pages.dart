import 'package:get/get.dart';

import '../../pages/admin/ingredients/views/ingredients_page.dart';
import '../../pages/admin/main/views/admin_page.dart';
import '../../pages/admin/recipes/bindings/edit_recipe_binding.dart';
import '../../pages/admin/recipes/bindings/recipe_binding.dart';
import '../../pages/admin/recipes/bindings/register_recipe_binding.dart';
import '../../pages/admin/recipes/controllers/recipe_edit_controller.dart';
import '../../pages/admin/recipes/controllers/recipe_register_controller.dart';
import '../../pages/admin/recipes/views/recipe_page.dart';
import '../../pages/admin/recipes/views/widgets/recipe_modify.dart';
import '../../pages/login/views/login_page.dart';
import '../../pages/shared/views/access_denied_page.dart';
import '../../pages/shared/views/drawer.dart';
import '../middlewares/role_guard_middleware.dart';
import 'routes.dart';

final _middleware = [RoleGuardMiddleware()];
final pages = [
  GetPage(
    name: Routes.login,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: Routes.adminPage,
    page: () => const AdminPage(),
  ),
  GetPage(
    name: Routes.ingredientsPage,
    page: IngredientsPage.new,
  ),
  GetPage(
    name: Routes.drawerPage,
    middlewares: _middleware,
    page: () => const DrawerScreen(),
  ),
  GetPage(
    name: Routes.accessDeniedPage,
    page: () => const AccessDeniedPage(),
  ),
  GetPage(
    name: Routes.recipePage,
    page: () => const RecipePage(),
    binding: RecipeBinding(),
    children: [
      GetPage(
        name: Routes.registerRecipePage,
        binding: RegisterRecipeBinding(),
        page: () => const RecipeModify<RecipeRegisterController>(),
      ),
      GetPage(
        name: Routes.editRecipePage,
        binding: EditRecipeBinding(),
        page: () => const RecipeModify<RecipeEditController>(),
      ),
    ],
  ),
];
