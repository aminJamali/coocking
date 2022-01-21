import 'recipe_view_model.dart';

class RecipeListViewModel {
  List<RecipeViewModel> elements;
  int totalElements;

  RecipeListViewModel({
    required final this.elements,
    required final this.totalElements,
  });

  factory RecipeListViewModel.fromJson(final Map<String, dynamic> json) {
    final _elements = <RecipeViewModel>[];
    if (json['elements'] != null) {
      for (final element in json['elements']) {
        _elements.add(RecipeViewModel.fromJson(element));
      }
    }

    return RecipeListViewModel(
      elements: _elements,
      totalElements: json['totalElements'],
    );
  }
}
