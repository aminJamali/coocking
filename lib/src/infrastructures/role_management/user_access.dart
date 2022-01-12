

import 'role_access_management.dart';

class UserAccess{
 static bool hasUserAccess(final String route) {
    final Map<String, List<String>> rolesMap =
        RoleAccessManagement.roleManagementMap;
    // final Map<String, List<String>> searchedRoles =
    // rolesMap.whereKeys((final key) {
    //   if (route.startsWith(key)) {
    //     return true;
    //   }
    //   return false;
    // });

    // for (final role in TokenInfo.roles) {
    //
    //   final bool _roleExistsInFoundMap=searchedRoles
    //       .where((final entry) => entry.value.contains(role))
    //       .isNot_null;
    //
    //   if (_roleExistsInFoundMap) {
    //     return true;
    //   }
    // }
    //return false;
   return true;
  }

}