class RecipeCategoryViewModel {
  int id;
  String title;

  RecipeCategoryViewModel({required final this.id, required final this.title});

 factory RecipeCategoryViewModel.fromJson(final Map<String, dynamic> json) =>
      RecipeCategoryViewModel(
        id: json['id'],
        title: json['title'],
      );
}
