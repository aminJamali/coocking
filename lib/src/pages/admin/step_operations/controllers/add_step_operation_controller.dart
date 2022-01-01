import 'package:cooking/src/pages/admin/step_operations/controllers/modify_step_operations_controller.dart';
import 'package:cooking/src/pages/admin/step_operations/repositories/add_step_operation_controller.dart';

class AddStepOperationController extends ModifyStepOperationController {
  AddStepOperationRepository repository = AddStepOperationRepository();
  @override
  void modifyStepOperation() {}
}
