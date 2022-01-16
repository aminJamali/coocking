import 'package:cooking/src/infrastructures/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/utils.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({final Key? key}) : super(key: key);
  static const TextStyle _headerTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const double _iconSize = 50.0;

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: _body(),
      );

  Widget _body() => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600.0),
          child: Padding(
            padding: Utils.middlePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _headerButtonBuilder(
                          onTaped: () => Get.toNamed(Routes.ingredientsPage),
                          title: 'مواد اولیه',
                          icon: Icons.category_outlined),
                    ),
                    Utils.largeHorizontalSpace,
                    Expanded(
                      child: _headerButtonBuilder(
                          onTaped: () {},
                          title: 'مراحل پخت',
                          icon: Icons.microwave_outlined),
                    ),
                  ],
                ),
                Utils.largeVerticalSpace,
                SizedBox(
                  width: Get.width,
                  child: _headerButtonBuilder(
                      onTaped: () => Get.toNamed(Routes.recipePage),
                      title: 'دستور پخت',
                      icon: Icons.outdoor_grill_outlined),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _headerButtonBuilder({
    required final void Function() onTaped,
    required final IconData icon,
    required final String title,
  }) =>
      ElevatedButton(
        onPressed: onTaped,
        child: Padding(
          padding: Utils.middlePadding,
          child: Column(
            children: [
              Icon(
                icon,
                size: _iconSize,
              ),
              Text(
                title,
                style: _headerTextStyle,
              ),
            ],
          ),
        ),
      );
}
