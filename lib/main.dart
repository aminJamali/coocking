import 'package:flutter/material.dart';

import 'poll_pages/goal_poll.dart';
import 'styles/cooking_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        builder: (final context, final child) => Theme(
            data: CookingTheme(fontFamily: 'IRANSans').themeData.copyWith(
                primaryColor: primaryColor,
                colorScheme:
                    ColorScheme.fromSwatch().copyWith(secondary: accentColor)),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            )),
        home: const GoalPoll(),
      );
}
