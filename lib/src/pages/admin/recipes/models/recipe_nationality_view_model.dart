class RecipeNationalityViewModel {
  int id;
  String name;

  RecipeNationalityViewModel(
      {required final this.id, required final this.name});

  factory RecipeNationalityViewModel.fromJson(
          final Map<String, dynamic> json) =>
      RecipeNationalityViewModel(
        id: json['id'],
        name: json['name'],
      );
}
