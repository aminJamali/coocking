import 'package:cooking/src/infrastructures/utils/utils.dart';
import 'package:cooking/src/pages/admin/step_operations/models/step_operation_view_model.dart';
import 'package:cooking/src/pages/shared/views/advance_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepoperationListItem extends StatelessWidget {
  final StepOperationViewModel stepOperationViewModel;
  final void Function() onEditTaped;
  const StepoperationListItem(
      {required this.stepOperationViewModel,
      required this.onEditTaped,
      final Key? key})
      : super(key: key);

  @override
  Widget build(final BuildContext context) => _stepOperation();

  Widget _stepOperation() => Card(
        color: Colors.white,
        shape: _border(),
        margin: Utils.middlePadding,
        elevation: Utils.smallSpace,
        child: Padding(
          padding: Utils.smallPadding,
          child: _item(),
        ),
      );

  Widget _item() => Row(
        children: [
          AdvanceNetworkImage(
            imageSize: 60,
            documentId: stepOperationViewModel.avatarId,
          ),
          Utils.largeHorizontalSpace,
          _details(),
          const Spacer(),
          _edit(),
        ],
      );

  Widget _details() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stepOperationViewModel.title!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  Widget _edit() => IconButton(
        onPressed: onEditTaped,
        icon: Icon(
          Icons.edit_outlined,
          size: 30,
          color: Get.theme.colorScheme.primary,
        ),
      );

  RoundedRectangleBorder _border() => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(Utils.middleSpace)));
}
