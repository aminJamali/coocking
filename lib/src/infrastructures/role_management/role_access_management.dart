import '../routes/routes.dart';

import 'roles.dart';

class RoleAccessManagement {
  static Map<String, List<String>> roleManagementMap = {
    Routes.login: [
      Roles.admin,
      Roles.user,
    ],


  };
}
