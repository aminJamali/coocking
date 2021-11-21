import 'package:cooking/src/pages/login/login_page.dart';
import 'package:get/get.dart';

import '../../pages/admin/admin_page.dart';
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
];
