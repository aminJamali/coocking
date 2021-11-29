import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(

        backgroundColor: context.theme.backgroundColor,
        body: Center(
          child: ElevatedButton(
            onPressed: () => Get.toNamed(Routes.adminPage),
            child: const Text('ورود به صفحه مدیریت'),
          ),
        ),
      );
}
