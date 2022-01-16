class RecipeDocumentsDto {
  String documentId, extension;

  RecipeDocumentsDto({
    required final this.documentId,
    required final this.extension,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['documentId'] = documentId;
    data['extension'] = extension;
    return data;
  }
}
