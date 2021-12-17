import 'package:cooking/src/infrastructures/routes/routes.dart';
import 'package:cooking/src/pages/login/models/login_dto.dart';
import 'package:cooking/src/pages/login/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository = LoginRepository();
  LoginDto loginDto = LoginDto(username: '2280113732', password: '123456');
  RxBool loginLoading = false.obs;

  Future<void> login() async {
    loginLoading.value = true;
    final Either<String, String> response =
        await _loginRepository.login(loginDto: loginDto);
    response.fold(
      (final exception) => loginLoading.value = false,
      (final result) {
        loginLoading.value = false;
        
        //Get.toNamed(Routes.drawerPage);
      },
    );
  }
}
