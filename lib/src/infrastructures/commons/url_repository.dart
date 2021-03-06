class UrlRepository {
  static String ingredients = 'ingredients';
  static String ingredientUnits = 'ingredient-units';
  static String documents = 'documents';
  static String userManagement = 'user-management';
  static String stepOperations = 'step-operations';
  static String login = 'login';
  static String recipes = 'recipes';
  static String recipeCategories = 'recipe-categories';
  static String nationalities = 'nationalities';
  static String documentsUrl = '/$documents';

  static String getDocumentsUrl(
          {required final String documentId, final String? query}) =>
      '/$documents/$documentId$query';

  static String ingredientsUrl = '/$ingredients';
  static String stepOperationsUrl = '/$stepOperations';

  static String ingredientsUrlById({required final int ingredientId}) =>
      '$ingredientsUrl/$ingredientId';

  static String getStepOpeartionByIdUrl({required final int stepOperationId}) =>
      '$stepOperations/$stepOperationId';

  static String getAllIngredientsUrl({final String? query}) =>
      '/$ingredients$query';

  static String getAllStepOperationsUrl({final String? query = ''}) =>
      '/$stepOperations$query';

  static String loginUrl = '/$userManagement/$login';

  static String getIngredientUnitsUrl({final String? query}) =>
      '/$ingredientUnits$query';

  static String recipeUrl = '/$recipes';

  static String recipeUrlByQuery({final String? query}) => '$recipeUrl$query';

  static String recipeUrlById({required final int recipeId}) =>
      '$recipeUrl/$recipeId';

  static String recipeCategoryUrl = '/$recipeCategories';

  static String nationalityUrlByQuery({final String? query}) =>
      '/$nationalities$query';
}
