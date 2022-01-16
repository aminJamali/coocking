import 'package:dartz/dartz.dart';

import '../../../../infrastructures/commons/advance_http_client.dart';
import '../../../../infrastructures/commons/url_repository.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../models/recipe_full_view_model.dart';
import '../models/recipe_insert_dto.dart';

class RecipeModifyRepository {
  final AdvanceHttpClient _httpClient = Utils.http();

  Future<Either<String, RecipeFullViewModel>> getRecipe(
      {required final int recipeId}) async {
    final String _url = UrlRepository.recipeUrlById(recipeId: recipeId);
    final Either<String, dynamic> response = await _httpClient.get(_url);
    return response.fold(
      Left.new,
      (final data) => Right(RecipeFullViewModel.fromJson(data)),
    );
  }

  Future<Either<String, String>> insertRecipe(
      {required final RecipeInsertDto recipeInsertDto}) async {
    final Either<String, dynamic> response = await _httpClient
        .post(UrlRepository.recipeUrl, data: recipeInsertDto.toJson());
    return response.fold(
      Left.new,
      (final data) => Right(data as String),
    );
  }

  Future<Either<String, String>> updateRecipe(
      {required final RecipeInsertDto recipeInsertDto,
      required final int recipeId}) async {
    final String _url = UrlRepository.recipeUrlById(recipeId: recipeId);
    final Either<String, dynamic> response =
        await _httpClient.put(_url, data: recipeInsertDto.toJson());
    return response.fold(
      Left.new,
      (final data) => Right(data as String),
    );
  }
}
