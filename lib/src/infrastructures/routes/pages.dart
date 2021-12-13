import 'package:get/get.dart';

import '../../pages/admin/ingredients/views/ingredients_page.dart';
import '../../pages/admin/main/views/admin_page.dart';
import '../../pages/login/views/login_page.dart';
import '../../pages/shared/views/drawer.dart';
import 'routes.dart';

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
    page: () => const IngredientsPage(),
  ),
  GetPage(
    name: Routes.drawerPage,
    page: () => const DrawerScreen(),
  ),
];
