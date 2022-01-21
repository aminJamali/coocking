class RecipeStepsViewModel {
  int order, stepOperationId;
  String description;

  RecipeStepsViewModel(
      {required final this.order,
      required final this.description,
      required final this.stepOperationId});

  factory RecipeStepsViewModel.fromJson(final Map<String, dynamic> json) =>
      RecipeStepsViewModel(
          order : json['order'],
          description : json['description'],
          stepOperationId : json['stepOperationId'],
      );
}
