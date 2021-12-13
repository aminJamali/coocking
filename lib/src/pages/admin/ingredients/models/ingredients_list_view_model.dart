import 'ingredients_view_model.dart';

class IngredientsListViewModel {
  List<IngredientsViewModel>? elements;
  int? totalElements;

  IngredientsListViewModel({
    final this.elements,
    final this.totalElements,
  });

  IngredientsListViewModel.fromJson(final Map<String, dynamic> json) {
    if (json['elements'] != null) {
      elements = <IngredientsViewModel>[];
      for (final element in json['elements']) {
        elements!.add(IngredientsViewModel.fromJson(element));
      }
    }
    totalElements = json['totalElements'];
  }
}
