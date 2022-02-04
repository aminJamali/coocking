class RecipeStepsViewModel {
  int order, stepOperationId;
  String description;
  String? stepOperationTitle;

  RecipeStepsViewModel({
    required final this.order,
    required final this.description,
    required final this.stepOperationId,
    final this.stepOperationTitle,
  });

  factory RecipeStepsViewModel.fromJson(final Map<String, dynamic> json) =>
      RecipeStepsViewModel(
        order: json['order'],
        description: json['description'],
        stepOperationId: json['stepOperationId'],
      );
}
