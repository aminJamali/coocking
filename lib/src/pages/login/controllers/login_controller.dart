import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../infrastructures/commons/parameters.dart';
import '../../../infrastructures/routes/routes.dart';
import '../../shared/models/token_info.dart';
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
        final Map<String, dynamic> decodedToken = JwtDecoder.decode(result);
        TokenInfo.fromJson(decodedToken);
        Get.toNamed(Routes.drawerPage);
      },
    );
  }
}
