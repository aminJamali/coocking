class RecipeDocumentsViewModel {
  String documentId, extension;

  RecipeDocumentsViewModel({
    required final this.documentId,
    required final this.extension,
  });

  factory RecipeDocumentsViewModel.fromJson(final Map<String, dynamic> json) =>
      RecipeDocumentsViewModel(
        documentId: json['documentId'],
        extension: json['extension'],
      );
}
