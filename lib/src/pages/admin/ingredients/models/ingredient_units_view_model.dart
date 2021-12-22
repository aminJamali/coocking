class IngredientUnitsViewModel {
  int id;
  String title;

  IngredientUnitsViewModel({
    required final this.id,
    required final this.title,
  });

  factory IngredientUnitsViewModel.fromJson(final Map<String, dynamic> json) =>
      IngredientUnitsViewModel(
        id: json['id'],
        title: json['title'],
      );
}
