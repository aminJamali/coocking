import 'package:dartz/dartz.dart';

import '../../../../infrastructures/commons/advance_http_client.dart';
import '../../../../infrastructures/commons/url_repository.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../models/recipe_list_view_model.dart';

class RecipeRepository {
  final AdvanceHttpClient _httpClient = Utils.http();

  Future<Either<String, RecipeListViewModel>> getAllRecipes(
      {required final String query}) async {
    final String _url = UrlRepository.recipeUrlByQuery(query: query);
    final Either<String, dynamic> response = await _httpClient.get(_url);
    return response.fold(
      Left.new,
      (final data) => Right(RecipeListViewModel.fromJson(data)),
    );
  }

   Future<Either<String, String>> deleteRecipe(
      {
        required final int recipeId}) async {
    final String _url = UrlRepository.recipeUrlById(recipeId: recipeId);
    final Either<String, dynamic> response = await _httpClient
        .delete(_url);
    return response.fold(
      Left.new,
          (final data) => Right(data as String),
    );
  }
}
