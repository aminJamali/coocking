import 'package:flutter/material.dart';
import '../../../infrastructures/utils/utils.dart';

class DialogHeader extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;

  const DialogHeader({
  required final this.icon,
  required final this.color,
  required final this.title,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => _header();

  Widget _header() => Column(children: [
        Utils.largeVerticalSpace,
        Icon(
          icon,
          color: color,
          size: 45,
        ),
        Utils.middleVerticalSpace,
        _headerTitle(),
      ]);

  Widget _headerTitle() => Text(
        title,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
      )
  );
}
