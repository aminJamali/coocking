class UrlRepository {
  static String ingredients = 'ingredients';
  static String ingredientUnits = 'ingredient-units';
  static String documents = 'documents';
  static String userManagement = 'user-management';
  static String stepOperations = '/step-operations';
  static String login = 'login';

  static String documentsUrl = '/$documents';

  static String getDocumentsUrl(
          {required final String documentId, final String? query}) =>
      '/$documents/$documentId$query';

  static String ingredientsUrl = '/$ingredients';
  static String stepOperationsUrl = '/$stepOperations';

  static String getIngredientsUrl({required final int ingredientId}) =>
      '/$ingredients/$ingredientId';

  static String getStepOpeartionsUrl({required final int stepOperationId}) =>
      '/$ingredients/$stepOperationId';

  static String getAllIngredientsUrl({final String? query}) =>
      '/$ingredients$query';

  static String getAllStepOperationsUrl({final String? query = ''}) =>
      '/$stepOperations $query';

  static String loginUrl = '/$userManagement/$login';

  static String getIngredientUnitsUrl({final String? query}) =>
      '/$ingredientUnits$query';
}
