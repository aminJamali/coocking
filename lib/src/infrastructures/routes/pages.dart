import 'package:cooking/src/infrastructures/middlewares/role_guard_middleware.dart';
import 'package:cooking/src/pages/shared/views/access_denied_page.dart';
import 'package:get/get.dart';

import '../../pages/admin/ingredients/views/ingredients_page.dart';
import '../../pages/admin/main/views/admin_page.dart';
import '../../pages/login/views/login_page.dart';
import '../../pages/shared/views/drawer.dart';
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
];
