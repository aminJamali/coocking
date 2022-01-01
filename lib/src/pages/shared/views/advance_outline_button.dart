import 'package:flutter/material.dart';

class AdvanceOutlinedButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final ButtonStyle? style;

  const AdvanceOutlinedButton({
    required final this.title,
    final Key? key,
    final this.onPressed,
    final this.style,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => _enableButton();

  Widget _enableButton() => OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: _buttonText(),
      );

  Widget _buttonText() => Text(
        title,
      );
}
