import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../infrastructures/commons/parameters.dart';
import '../../../infrastructures/routes/routes.dart';
import '../models/login_dto.dart';
import '../repositories/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository = LoginRepository();
  LoginDto loginDto = LoginDto(username: '2301064506', password: '123456');
  RxBool loginLoading = false.obs;

  Future<void> login() async {
    loginLoading.value = true;
    final Either<String, String> response =
        await _loginRepository.login(loginDto: loginDto);
    response.fold(
      (final exception) => loginLoading.value = false,
      (final result) {
        loginLoading.value = false;
        Parameters.token=result;
        Get.toNamed(Routes.drawerPage);
      },
    );
  }
}
