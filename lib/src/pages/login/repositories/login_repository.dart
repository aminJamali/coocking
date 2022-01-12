import 'package:dartz/dartz.dart';

import '../../../infrastructures/commons/advance_http_client.dart';
import '../../../infrastructures/commons/url_repository.dart';
import '../../../infrastructures/utils/utils.dart';
import '../models/login_dto.dart';

class LoginRepository {
  final AdvanceHttpClient _httpClient= Utils.http();


  Future<Either<String, String>> login({required final LoginDto loginDto}) async {
    final String _url = UrlRepository.loginUrl;
    final Either<String, dynamic> response =
        await _httpClient.post(_url, data: loginDto.toJson());
    return response.fold(
      Left.new,
      (final data) => Right(data as String),
    );
  }
}
