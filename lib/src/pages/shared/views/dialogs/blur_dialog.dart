import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../infrastructures/utils/utils.dart';

class BlurDialog extends StatelessWidget {
  final Widget dialogChild;

  const BlurDialog({
    required final this.dialogChild,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => _dialog();

  Widget _dialog() => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Utils.largeSpace)),
          child: dialogChild,
        ),
      );
}
