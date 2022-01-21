class RecipeIngredientsDto {
  int quantity, ingredientId;

  RecipeIngredientsDto({
    required final this.quantity,
    required final this.ingredientId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['ingredientId'] = ingredientId;
    return data;
  }
}
