class IngredientsDto {
  int ingredientUnitId;
  String title;
  String? avatarId;
  String? extension;

  IngredientsDto({
  required final  this.ingredientUnitId,
  required final  this.title,
  final  this.avatarId,
  final  this.extension,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ingredientUnitId'] = ingredientUnitId;
    data['title'] = title;
    data['avatarId'] = avatarId;
    data['extension'] = extension;
    return data;
  }
}
