import 'package:dartz/dartz.dart';

import '../../../../infrastructures/commons/advance_http_client.dart';
import '../../../../infrastructures/commons/url_repository.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../models/step_operation_list_view_model.dart';

class StepOperationRepository {
  AdvanceHttpClient? _httpClient;

  StepOperationRepository() {
    _httpClient = Utils.http();
  }

  Future<Either<String, StepOperationListViewModel>> getAllStepOperations(
      {final String? query}) async {
    final String _url = UrlRepository.stepOperations;
    final Either<String, dynamic> response = await _httpClient!.get(
      _url,
    );
    return response.fold(
      Left.new,
      (final data) => Right(StepOperationListViewModel.fromJson(data)),
    );
  }

  Future<Either<String, String>> deleteStepOperation(
      {required final int stepOperationId}) async {
    final String _url =
        UrlRepository.getStepOpeartionByIdUrl(stepOperationId: stepOperationId);
    final Either<String, dynamic> response = await _httpClient!.delete(_url);
    return response.fold(
      Left.new,
      (final data) => Right(data as String),
    );
  }
}
