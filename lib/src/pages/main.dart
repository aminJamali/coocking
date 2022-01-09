import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../infrastructures/routes/pages.dart';
import '../infrastructures/styles/cooking_theme_data.dart';
import 'login/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => GetMaterialApp(
        title: 'Kachi Chef',
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa', 'IR'),
    theme: cookingThemeData,
        // builder: (final context, final child) => Theme(
        //     data: CookingTheme(fontFamily: 'IRANSans').themeData.copyWith(
        //         primaryColor: primaryColor,
        //         colorScheme:
        //             ColorScheme.fromSwatch().copyWith(secondary: accentColor)),
        //     child: Directionality(
        //       textDirection: TextDirection.rtl,
        //       child: child!,
        //     )),
        textDirection: TextDirection.rtl,
        getPages: pages,
        home: const LoginPage(),
      );
}
