import '../../pages/shared/models/token_info.dart';
import '../utils/map_extension.dart';
import 'role_access_management.dart';

class UserAccess {
  static bool hasUserAccess(final String route) {
    final Map<String, List<String>> rolesMap =
        RoleAccessManagement.roleManagementMap;

    final Map<String, List<String>> searchedRoles =
        rolesMap.whereKeys(route.startsWith);

    for (final role in TokenInfo.roles) {
      final bool _roleExistsInFoundMap = searchedRoles.entries
          .where((final element) => element.value.contains(role)).isNotEmpty;

      if (_roleExistsInFoundMap) {
        return true;
      }
    }

    return false;
  }
}
