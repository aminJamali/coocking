import 'package:dartz/dartz.dart';

import '../../../../infrastructures/commons/advance_http_client.dart';
import '../../../../infrastructures/commons/url_repository.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../../ingredients/models/ingredients_list_view_model.dart';
import '../../step_operations/models/step_operation_list_view_model.dart';
import '../models/recipe_category_view_model.dart';
import '../models/recipe_full_view_model.dart';
import '../models/recipe_insert_dto.dart';
import '../models/recipe_nationality_list_view_model.dart';

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

  Future<Either<String, List<RecipeCategoryViewModel>>> getCategory() async {
    final Either<String, dynamic> response =
        await _httpClient.get(UrlRepository.recipeCategoryUrl);
    return response.fold(
      Left.new,
      (final data) {
        final List<RecipeCategoryViewModel> _categories =
            <RecipeCategoryViewModel>[];
        if (data != null) {
          for (final element in data) {
            _categories.add(RecipeCategoryViewModel.fromJson(element));
          }
        }

        return Right(_categories);
      },
    );
  }

  Future<Either<String, int>> insertRecipe(
      {required final RecipeInsertDto recipeInsertDto}) async {
    final Either<String, dynamic> response = await _httpClient
        .post(UrlRepository.recipeUrl, data: recipeInsertDto.toJson());
    return response.fold(
      Left.new,
      (final data) => Right(data as int),
    );
  }

  Future<Either<String, RecipeNationalityListViewModel>> getNationality(
      {required final String query}) async {
    final String _url = UrlRepository.nationalityUrlByQuery(query: query);
    final Either<String, dynamic> response = await _httpClient.get(_url);
    return response.fold(
      Left.new,
      (final data) => Right(RecipeNationalityListViewModel.fromJson(data)),
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

  Future<Either<String, IngredientsListViewModel>> getAllIngredients(

      {required final String query}) async {
    final String _url = UrlRepository.getAllIngredientsUrl(query: query);
    final Either<String, dynamic> response = await _httpClient.get(_url);
    return response.fold(
      Left.new,
          (final data) => Right(IngredientsListViewModel.fromJson(data)),
    );
  }

  Future<Either<String, StepOperationListViewModel>> getAllStepOperation(
      {final String? query}) async {
    final String _url = UrlRepository.getAllStepOperationsUrl();
    final Either<String, dynamic> response = await _httpClient.get(
      _url,
    );
    return response.fold(
      Left.new,
          (final data) => Right(StepOperationListViewModel.fromJson(data)),
    );
  }
}
