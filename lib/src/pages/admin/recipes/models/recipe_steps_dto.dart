class RecipeStepsDto {
  int order,stepOperationId;
  String description;

  RecipeStepsDto(
      {required final this.order,
      required final this.description,
      required final this.stepOperationId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['description'] = description;
    data['stepOperationId'] = stepOperationId;
    return data;
  }
}
