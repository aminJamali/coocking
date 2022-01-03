import 'step_operation_view_model.dart';

class StepOperationListViewModel {
  List<StepOperationViewModel>? elements;
  int? totalElements;

  StepOperationListViewModel({
    final this.elements,
    final this.totalElements,
  });

  StepOperationListViewModel.fromJson(final Map<String, dynamic> json) {
    if (json['elements'] != null) {
      elements = <StepOperationViewModel>[];
      for (final element in json['elements']) {
        elements!.add(StepOperationViewModel.fromJson(element));
      }
    }
    totalElements = json['totalElements'];
  }
}
