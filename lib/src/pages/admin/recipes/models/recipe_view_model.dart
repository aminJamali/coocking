class RecipeViewModel {
  int id, duration;
  String foodName, recipeCategoryTitle, nationalityName;

  RecipeViewModel({
    required final this.id,
    required final this.foodName,
    required final this.duration,
    required final this.recipeCategoryTitle,
    required final this.nationalityName,
  });
  factory RecipeViewModel.fromJson(final Map<String, dynamic> json) =>
      RecipeViewModel(
        id: json['id'],
        foodName: json['foodName'],
        duration: json['duration'],
        recipeCategoryTitle: json['recipeCategoryTitle'],
        nationalityName: json['nationalityName'],
      );
}
