import 'package:cooking/src/infrastructures/utils/pagination_list.dart';
import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/pages/admin/step_operations/models/step_operation_list_view_model.dart';
import 'package:cooking/src/pages/admin/step_operations/models/step_operation_view_model.dart';
import 'package:cooking/src/pages/admin/step_operations/repositories/step_operation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class StepOperationsController extends GetxController {
  final StepOperationRepository _stepOperationRepository =
      StepOperationRepository();
  final PaginationList<StepOperationViewModel> paginationList =
      PaginationList();
  RxBool deleteLoading = false.obs;

  @override
  void onReady() {
    getAllStepOperations();
    super.onReady();
  }

  Future<void> refreshStepoperations() async {
    resetStepOperationList();
    await getAllStepOperations();
  }

  void resetStepOperationList() {
    if (paginationList.key.currentState != null) {
      paginationList.key.currentState!.clearAllItems();
    } else if (paginationList.list.isNotEmpty) {
      paginationList.list.clear();
    }
    paginationList.paginationOffset = 0;
  }

  Future<void> getAllStepOperations() async {
    paginationList.hasMoreData.value = true;
    final Either<String, StepOperationListViewModel> response =
        await _stepOperationRepository.getAllStepOperations(
            query: paginationList.query);
    response.fold(
      (final exception) {
        paginationList.hasMoreData.value = false;
      },
      (final result) {
        paginationList.paginationOffset++;
        if (result.elements!.isEmpty) {
          paginationList.hasMoreData.value = false;
        }
        paginationList.key.currentState!.addAll(result.elements!);
      },
    );
  }

  void addToLocalList(
          {required final StepOperationViewModel stepOperationViewModel}) =>
      paginationList.key.currentState!
          .addItem(stepOperationViewModel, atIndex: 0);

  void updateOnLocalList(
      {required final StepOperationViewModel stepOperationViewModel}) {
    removeOnLocalList(stepOperationId: stepOperationViewModel.id!);
    addToLocalList(stepOperationViewModel: stepOperationViewModel);
  }

  Future<void> deleteStepOperation(final int stepOperationId) async {
    deleteLoading.value = true;
    final Either<String, String> response = await _stepOperationRepository
        .deleteStepOperation(stepOperationId: stepOperationId);
    response.fold(
      (final exception) {
        deleteLoading.value = false;
      },
      (final result) {
        removeOnLocalList(stepOperationId: stepOperationId);
        deleteLoading.value = false;
        Get.back();
        Utils.successToast(message: 'دستور پخت با موفقیت حذف گردید');
      },
    );
  }

  void removeOnLocalList({required final int stepOperationId}) {
    final int _index = paginationList.key.currentState!.items
        .indexWhere((final element) => element.id == stepOperationId);
    paginationList.key.currentState!.removeItemAt(_index);
  }
}
