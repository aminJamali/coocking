import 'package:dartz/dartz.dart';
import '../../../../infrastructures/commons/advance_http_client.dart';
import '../../../../infrastructures/commons/url_repository.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../models/ingredients_list_view_model.dart';

class IngredientsRepository {
  final AdvanceHttpClient _httpClient = Utils.http();

  Future<Either<String, IngredientsListViewModel>> getAllIngredients(

      {required final String query}) async {
    final String _url = UrlRepository.getAllIngredientsUrl(query: query);
    final Either<String, dynamic> response = await _httpClient.get(_url);
    return response.fold(
      Left.new,
      (final data) => Right(IngredientsListViewModel.fromJson(data)),
    );
  }

  Future<Either<String, String>> deleteIngredient(
      {required final int ingredientId}) async {
    final String _url =
        UrlRepository.getIngredientsUrl(ingredientId: ingredientId);
    final Either<String, dynamic> response = await _httpClient.delete(_url);
    return response.fold(
      Left.new,
      (final data) => Right(data as String),
    );
  }
}
