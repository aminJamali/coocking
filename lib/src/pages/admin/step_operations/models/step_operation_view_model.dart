class StepOperationViewModel {
  int? id;
  String? title;
  String? avatarId;
  String? extension;

  StepOperationViewModel(
      {final this.id,
      final this.title,
      final this.avatarId,
      final this.extension});

  StepOperationViewModel.fromJson(final Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    avatarId = json['avatarId'];
    extension = json['extension'];
  }
}
