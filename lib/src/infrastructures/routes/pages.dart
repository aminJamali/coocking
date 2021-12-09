import 'package:cooking/src/pages/shared/drawer.dart';
import 'package:get/get.dart';

import '../../pages/admin/main/views/admin_page.dart';
import '../../pages/admin/raw_material/views/raw_material_page.dart';
import '../../pages/admin/raw_material/views/widgets/modify_raw_material.dart';
import '../../pages/login/views/login_page.dart';
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
    name: Routes.rawMaterialPage,
    page: () => const RawMaterialPage(),
  ),
  GetPage(
    name: Routes.registerRawMaterialPage,
    page: () => const ModifyRawMaterial(),
  ),
  GetPage(
    name: Routes.drawerPage,
    page: () => DrawerScreen(),
  ),
];
