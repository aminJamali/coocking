import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/pages/admin/step_operations/controllers/edit_step_operations_controller.dart';
import 'package:cooking/src/pages/admin/step_operations/controllers/step_operations_controller.dart';
import 'package:cooking/src/pages/admin/step_operations/models/step_operation_view_model.dart';
import 'package:cooking/src/pages/admin/step_operations/views/dialog/modify_step_operations_dialog.dart';
import 'package:cooking/src/pages/admin/step_operations/views/widgets/step_operation_list_item.dart';
import 'package:cooking/src/pages/shared/views/advance_list_view.dart';
import 'package:cooking/src/pages/shared/views/dialogs/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepOperationList extends StatelessWidget {
  final controller = Get.put(StepOperationsController());
  StepOperationList({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    Get.lazyPut(() => StepOperationsController);
    return _stepOperationList();
  }

  Widget _stepOperationList() => Obx(
        () => AdvanceListView<StepOperationViewModel>(
            key: controller.paginationList.key,
            items: controller.paginationList.list,
            hasMoreData: controller.paginationList.hasMoreData.value,
            onRefreshData: controller.refreshStepoperations,
            onLoadMoreData: controller.getAllStepOperations,
            itemBuilder: (
              final context,
              final item,
              final index,
            ) =>
                StepoperationListItem(
                  stepOperationViewModel: item,
                  onEditTaped: () => _editTaped(item),
                ),
            emptyPageTitle: 'تاکنون مرحله پختی ثبت نشده است.'),
      );

  Future<dynamic> _editTaped(
          final StepOperationViewModel stepOperationViewModel) =>
      Utils.showDialog(
        thenValue: (final item) {
          if (item != null) {
            controller.updateOnLocalList(stepOperationViewModel: item);
          }
        },
        page: ModifyStepOperationsDialog(
            () => EditStepOperationController(stepOperationViewModel)),
      );
}
