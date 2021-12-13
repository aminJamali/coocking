class IngredientsViewModel {
  int? id;
  int? ingredientUnitId;
  String? ingredientUnitTitle;
  String title;
  String? avatarId;
  String? extension;

  IngredientsViewModel({
   required final this.title,
   final this.id,
   final this.ingredientUnitId,
   final this.ingredientUnitTitle,
   final this.avatarId,
   final this.extension,
  });

  factory IngredientsViewModel.fromJson(final Map<String, dynamic> json) =>
      IngredientsViewModel(
        id: json['id'],
        title: json['title'],
        ingredientUnitId: json['ingredientUnitId'],
        ingredientUnitTitle: json['ingredientUnitTitle'],
        avatarId: json['avatarId'],
        extension: json['extension'],
      );
}
