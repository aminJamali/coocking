import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final Function onChanged;
  const LabeledCheckbox({
    required final this.label,
    required final this.value,
    required final this.onChanged,
  });

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              activeColor: Colors.blue,
              value: value,
              onChanged: (final newValue) => onChanged(newValue!),
            ),
          ],
        ),
      ),
    );
  }
}
