import 'package:cooking/src/infrastructures/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../role_management/user_access.dart';

class RoleGuardMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(final String? route) =>
      UserAccess.hasUserAccess(route!)
          ? null
          : const RouteSettings(name: Routes.accessDeniedPage);

  @override
  int get priority => 1;
}
