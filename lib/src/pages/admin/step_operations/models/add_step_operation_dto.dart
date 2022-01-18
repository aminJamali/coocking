import 'package:cooking/src/pages/admin/step_operations/models/step_operation_view_model.dart';

class AddStepOperationDto {
  String? avatarId, extension;
  String title;
  AddStepOperationDto(
      {final this.avatarId, required final this.title, final this.extension});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['avatarId'] = avatarId;
    data['extension'] = extension;
    return data;
  }

  StepOperationViewModel convertToViewModel(
          {required final int id, required final String unitTitle}) =>
      StepOperationViewModel(
        title: title,
        id: id,
        avatarId: avatarId,
        extension: extension,
      );
}
