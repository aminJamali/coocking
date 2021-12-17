import 'package:dartz/dartz.dart';
import '../../../../infrastructures/commons/http_client.dart';
import '../../../../infrastructures/commons/url_repository.dart';
import '../../../../infrastructures/utils/utils.dart';
import '../models/ingredients_list_view_model.dart';

class IngredientsRepository {
  HttpClient? _httpClient;

  IngredientsRepository() {
    _httpClient = Utils.http();
  }

  Future<Either<String, IngredientsListViewModel>> getAllIngredients(
      {final String? query}) async {
    final String _url = UrlRepository.getAllIngredientsUrl();
    final Either<String, dynamic> response = await _httpClient!.get(_url,);
    return response.fold(
      (final exception) => Left(exception),
      (final data) => Right(IngredientsListViewModel.fromJson(data)),
    );
  }
}
