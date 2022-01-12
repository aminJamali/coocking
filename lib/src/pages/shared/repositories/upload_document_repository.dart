import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../infrastructures/commons/advance_http_client.dart';
import '../../../infrastructures/commons/url_repository.dart';
import '../../../infrastructures/utils/utils.dart';

class UploadDocumentRepository {
  final AdvanceHttpClient _httpClient = Utils.http();

  Future<Either<String, String>> uploadDocument({
    required final FormData formData,
  }) async {
    final _url = UrlRepository.documentsUrl;
    final Either<String, dynamic> response =
        await _httpClient.post(_url, data: formData);
    return response.fold(
      Left.new,
      (final data) => Right(data as String),
    );
  }
}
