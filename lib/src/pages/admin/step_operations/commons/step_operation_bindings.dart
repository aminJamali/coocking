import 'package:cooking/src/pages/admin/step_operations/controllers/step_operations_controller.dart';
import 'package:get/get.dart';

class StepOperationBindings extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => StepOperationsController);
}
