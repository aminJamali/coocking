import 'ingredient_units_view_model.dart';

class IngredientUnitsListViewModel {
  List<IngredientUnitsViewModel>? elements;
  int? totalElements;

  IngredientUnitsListViewModel({
   final this.elements,
   final this.totalElements,
  });

  IngredientUnitsListViewModel.fromJson(final Map<String, dynamic> json) {
    if (json['elements'] != null) {
      elements = <IngredientUnitsViewModel>[];
      for (final element in json['elements']) {
        elements!.add(IngredientUnitsViewModel.fromJson(element));
      }
    }
    totalElements = json['totalElements'];
  }
}
