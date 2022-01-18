import 'package:cooking/src/infrastructures/commons/advance_http_client.dart';
import 'package:cooking/src/infrastructures/commons/url_repository.dart';
import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/pages/admin/step_operations/models/add_step_operation_dto.dart';
import 'package:cooking/src/pages/admin/step_operations/models/step_operation_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class ModifyStepOperationRepository {
  late final AdvanceHttpClient _httpClient;
  ModifyStepOperationRepository() {
    _httpClient = Utils.http();
  }
  Future<Either<String, StepOperationViewModel>> getStepOperationById(
      {required final int id}) async {
    final String _url = UrlRepository.getStepOpeartionsUrl(stepOperationId: id);
    final Either<String, dynamic> response = await _httpClient.get(
      _url,
    );
    return response.fold(
      (final exception) => Left(exception),
      (final data) => Right(StepOperationViewModel.fromJson(data)),
    );
  }

  Future<Either<String, int>> adddStepOperation(
      {required final AddStepOperationDto addStepOperationDto}) async {
    final String _url = UrlRepository.stepOperations;
    final Either<String, dynamic> response =
        await _httpClient.post(_url, data: addStepOperationDto.toJson());
    return response.fold(
      (final exception) => Left(exception),
      (final data) => Right(data),
    );
  }

  Future<Either<String, String>> editStepOperation(
      {required final AddStepOperationDto addstepOperationDto,
      required final int stepOperationId}) async {
    final String _url =
        UrlRepository.getStepOpeartionsUrl(stepOperationId: stepOperationId);
    final Either<String, dynamic> response =
        await _httpClient.put(_url, data: addstepOperationDto.toJson());
    return response.fold(
      (final exception) => Left(exception),
      (final data) => Right(data),
    );
  }
}
