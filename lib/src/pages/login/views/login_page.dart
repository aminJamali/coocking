import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/views/fill_button.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final controller =Get.put(LoginController());
    return Scaffold(
        body: Center(
          child: Obx(
            () => FillButton(
              onPressed: controller.login,
              title: 'ورود به صفحه مدیریت',
              loading: controller.loginLoading.value,
            ),
          ),
        ),
      );
  }
}
