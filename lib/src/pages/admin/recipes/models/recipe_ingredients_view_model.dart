class RecipeIngredientsViewModel {
  int quantity, ingredientId;
  String? ingredientTitle;

  RecipeIngredientsViewModel({
    required final this.quantity,
    required final this.ingredientId,
    final this.ingredientTitle,
  });

  factory RecipeIngredientsViewModel.fromJson(
          final Map<String, dynamic> json) =>
      RecipeIngredientsViewModel(
        quantity: json['quantity'],
        ingredientId: json['ingredientId'],
      );
}
