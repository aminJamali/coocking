import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/pages/admin/step_operations/controllers/add_step_operation_controller.dart';
import 'package:cooking/src/pages/admin/step_operations/views/widgets/step_operation_list.dart';
import 'package:flutter/material.dart';

import 'dialog/modify_step_operations_dialog.dart';

class StepOperationsPage extends StatelessWidget {
  const StepOperationsPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      floatingActionButton: _addButton(),
      appBar: AppBar(
        title: const Text('مراحل پخت'),
        centerTitle: true,
        excludeHeaderSemantics: true,
      ),
      body: _body(),
    );
  }

  Widget _body() => Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Utils.maxWith),
          child: StepOperationList(),
        ),
      );

  Widget _addButton() => FloatingActionButton(
        onPressed: _onAddTaped,
        child: const Icon(Icons.add),
      );

  Future<dynamic> _onAddTaped() => Utils.showDialog(
        page: const ModifyStepOperationsDialog(AddStepOperationController.new),
      );
}
