import 'package:flutter/material.dart';

import '../../../infrastructures/utils/utils.dart';

class EmptyPage extends StatelessWidget {
  final String title;

  const EmptyPage({
    required final this.title,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => _emptyBackground(context);

  Widget _emptyBackground(final BuildContext context) => Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.primary),
            ),
            Utils.middleVerticalSpace,
            Image.asset(
              'lib/assets/images/dish.png',
              width: 80,
              height: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      );
}
