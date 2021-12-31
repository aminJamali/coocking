import 'package:cooking/src/infrastructures/utils/utils_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/utils.dart';
import '../advance_outline_button.dart';
import '../dialog_header.dart';
import '../fill_button.dart';
import 'blur_dialog.dart';

class DeleteDialog extends StatelessWidget {
  final void Function()? onDeleteTaped;
  final String headerTitle;
  final String? bodyMessage;
  final String doneButtonTitle;
  final bool loading;

  const DeleteDialog({
    required final this.headerTitle,
    final this.onDeleteTaped,
    final this.doneButtonTitle = 'حـذف',
    final this.loading = false,
    final this.bodyMessage,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => BlurDialog(
        dialogChild: _deleteBody(),
      );

  Widget _deleteBody() => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: Utils.largePadding,
            child: Column(
              children: [
                Utils.smallVerticalSpace,
                _header(),
                Utils.smallVerticalSpace,
                if (bodyMessage != null)
                  Text(
                    bodyMessage!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                Utils.largeVerticalSpace,
                _submitButton(),
              ],
            ),
          ),
        ),
      );

  Widget _header() => DialogHeader(
        icon: Icons.delete_forever_outlined,
        color: Get.theme.colorScheme.error,
        title: headerTitle,
      );

  Widget _submitButton() => Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FillButton(
            title: doneButtonTitle,
            onPressed: onDeleteTaped,
            loading: loading,
            style: UtilsTheme.errorFillButtonStyle(),
          ),
          AdvanceOutlinedButton(
            title: '      بازگشت      ',
            onPressed: Get.back,
            style: UtilsTheme.errorOutlineButtonStyle(),
          ),
        ],
      );
}
