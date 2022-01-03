import 'package:cooking/src/infrastructures/commons/advance_http_client.dart';
import 'package:cooking/src/infrastructures/commons/url_repository.dart';
import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/pages/admin/step_operations/models/step_operation_list_view_model.dart';
import 'package:cooking/src/pages/admin/step_operations/models/step_operation_view_model.dart';
import 'package:dartz/dartz.dart';

class StepOperationRepository {
  AdvanceHttpClient? _httpClient;

  StepOperationRepository() {
    _httpClient = Utils.http();
  }

  Future<Either<String, StepOperationListViewModel>> getAllIngredients(
      {final String? query}) async {
    final String _url = UrlRepository.getAllIngredientsUrl();
    final Either<String, dynamic> response = await _httpClient!.get(
      _url,
    );
    return response.fold(
      (final exception) => Left(exception),
      (final data) => Right(StepOperationListViewModel.fromJson(data)),
    );
  }
}
