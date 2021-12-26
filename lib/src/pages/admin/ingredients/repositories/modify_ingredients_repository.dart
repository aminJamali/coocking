import 'package:dartz/dartz.dart';

import '../../../../infrastructures/commons/advance_http_client.dart';
import '../../../../infrastructures/commons/url_repository.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../models/ingredient_units_list_view_model.dart';
import '../models/ingredients_dto.dart';
import '../models/ingredients_view_model.dart';

class ModifyIngredientsRepository {
  final AdvanceHttpClient _httpClient=Utils.http();


  Future<Either<String, IngredientsViewModel>> getIngredientById(
      {required final int id}) async {
    final String _url = UrlRepository.getIngredientsUrl(ingredientId: id);
    final Either<String, dynamic> response = await _httpClient.get(
      _url,
    );
    return response.fold(
          (final exception) => Left(exception),
          (final data) => Right(IngredientsViewModel.fromJson(data)),
    );
  }

  Future<Either<String, String>> setIngredient(
      {required final IngredientsDto ingredientsDto}) async {
    final String _url = UrlRepository.ingredientsUrl;
    final Either<String, dynamic> response =
    await _httpClient.post(_url, data: ingredientsDto.toJson());
    return response.fold(
          (final exception) => Left(exception),
          (final data) => Right(data),
    );
  }

  Future<Either<String, int>> editIngredient(
      {required final IngredientsDto ingredientsDto,
        required final int ingredientId}) async {
    final String _url =
    UrlRepository.getIngredientsUrl(ingredientId: ingredientId);
    final Either<String, dynamic> response =
    await _httpClient.put(_url, data: ingredientsDto.toJson());
    return response.fold(
          (final exception) => Left(exception),
          (final data) => Right(data),
    );
  }

  Future<Either<String, IngredientUnitsListViewModel>> getIngredientsUnit(
      {required final String query}) async {
    final String _url = UrlRepository.getIngredientUnitsUrl(query: query);
    final Either<String, dynamic> response = await _httpClient.get(
      _url,
    );
    return response.fold(
          (final exception) => Left(exception),
          (final data) => Right(IngredientUnitsListViewModel.fromJson(data)),
    );
  }
}
