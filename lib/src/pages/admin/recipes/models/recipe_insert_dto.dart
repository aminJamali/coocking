import 'recipe_documents_dto.dart';

import 'recipe_ingredients_dto.dart';
import 'recipe_steps_dto.dart';

class RecipeInsertDto {
  String foodName;
  int duration, recipeCategoryId, nationalityId;
  List<RecipeIngredientsDto> recipeIngredients;
  List<RecipeDocumentsDto> recipeDocuments;
  List<RecipeStepsDto> recipeSteps;

  RecipeInsertDto(
      {required final this.foodName,
      required final this.duration,
      required final this.recipeCategoryId,
      required final this.nationalityId,
      required final this.recipeIngredients,
      required final this.recipeDocuments,
      required final this.recipeSteps});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodName'] = foodName;
    data['duration'] = duration;
    data['recipeCategoryId'] = recipeCategoryId;
    data['nationalityId'] = nationalityId;
    data['recipeIngredients'] =
        recipeIngredients.map((final item) => item.toJson()).toList();
    data['recipeDocuments'] =
        recipeDocuments.map((final item) => item.toJson()).toList();
    data['recipeSteps'] =
        recipeSteps.map((final item) => item.toJson()).toList();

    return data;
  }
}
