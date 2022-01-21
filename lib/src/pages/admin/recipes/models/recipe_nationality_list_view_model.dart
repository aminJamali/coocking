import 'recipe_nationality_view_model.dart';

class RecipeNationalityListViewModel {
  List<RecipeNationalityViewModel> elements;
  int totalElements;

  RecipeNationalityListViewModel({
    required final this.elements,
    required final this.totalElements,
  });

  factory RecipeNationalityListViewModel.fromJson(
      final Map<String, dynamic> json) {
    final _elements = <RecipeNationalityViewModel>[];
    if (json['elements'] != null) {
      for (final element in json['elements']) {
        _elements.add(RecipeNationalityViewModel.fromJson(element));
      }
    }

    return RecipeNationalityListViewModel(
      elements: _elements,
      totalElements: json['totalElements'],
    );
  }
}
