import 'package:flutter/material.dart';

import '../../../../infrastructures/utils/utils.dart';
import '../controllers/add_step_operation_controller.dart';
import 'dialog/modify_step_operations_dialog.dart';

class BakingSteps extends StatelessWidget {
  const BakingSteps({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      floatingActionButton: _addButton(),
      appBar: AppBar(
        title: const Text('دستور پخت'),
        centerTitle: true,
        excludeHeaderSemantics: true,
      ),
    );
  }

  Widget _addButton() => FloatingActionButton(
        onPressed: _onAddTaped,
        child: const Icon(Icons.add),
      );

  Future<dynamic> _onAddTaped() => Utils.showDialog(
        page: const ModifyStepOperationsDialog(AddStepOperationController.new),
      );
}
