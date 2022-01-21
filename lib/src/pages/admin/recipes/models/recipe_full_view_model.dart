import 'recipe_documents_view_model.dart';
import 'recipe_ingredients_view_model.dart';
import 'recipe_steps_view_model.dart';

class RecipeFullViewModel {
  String foodName;
  int duration, recipeCategoryId, nationalityId;
  List<RecipeIngredientsViewModel> recipeIngredients;
  List<RecipeDocumentsViewModel> recipeDocuments;
  List<RecipeStepsViewModel> recipeSteps;

  RecipeFullViewModel(
      {required final this.foodName,
      required final this.duration,
      required final this.recipeCategoryId,
      required final this.nationalityId,
      required final this.recipeIngredients,
      required final this.recipeDocuments,
      required final this.recipeSteps});

  factory RecipeFullViewModel.fromJson(final Map<String, dynamic> json) {
    final List<RecipeIngredientsViewModel> _recipeIngredients =
        <RecipeIngredientsViewModel>[];
    final List<RecipeDocumentsViewModel> _recipeDocuments =
        <RecipeDocumentsViewModel>[];
    final List<RecipeStepsViewModel> _recipeSteps = <RecipeStepsViewModel>[];

    if (json['recipeIngredients'] != null) {
      for (final element in json['recipeIngredients']) {
        _recipeIngredients.add(RecipeIngredientsViewModel.fromJson(element));
      }
    }
    if (json['recipeDocuments'] != null) {
      for (final element in json['recipeDocuments']) {
        _recipeDocuments.add(RecipeDocumentsViewModel.fromJson(element));
      }
    }
    if (json['recipeSteps'] != null) {
      for (final element in json['recipeSteps']) {
        _recipeSteps.add(RecipeStepsViewModel.fromJson(element));
      }
    }

    return RecipeFullViewModel(
      foodName: json['foodName'],
      duration: json['duration'],
      recipeCategoryId: json['recipeCategoryId'],
      nationalityId: json['nationalityId'],
      recipeDocuments: _recipeDocuments,
      recipeIngredients: _recipeIngredients,
      recipeSteps: _recipeSteps,
    );
  }
}
