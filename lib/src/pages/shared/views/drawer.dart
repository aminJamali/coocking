import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../admin/main/views/admin_page.dart';
import 'menu_widget.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({final Key? key}) : super(key: key);

  @override
  DrawerScreenState createState() => DrawerScreenState();
}

class DrawerScreenState extends State<DrawerScreen> {
  static GlobalKey<SliderMenuContainerState> drawerKey =
      GlobalKey<SliderMenuContainerState>();
  String? title;
  String currentPage = 'home';
  Map<String, Widget> navChildren = <String, Widget>{
    'home': const AdminPage(),
  };

  @override
  void initState() {
    title = 'صفحه اصلی';
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
      body: SliderMenuContainer(
          drawerIconColor: Colors.white,
          appBarColor:Theme.of(context).colorScheme.primary,
          hasAppBar: true,
          slideDirection: SlideDirection.RIGHT_TO_LEFT,
          key: drawerKey,
          sliderMenuOpenSize: 200,
          title: Text(
            title!,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          sliderMenu: Directionality(
            textDirection: TextDirection.rtl,
            child: MenuWidget(
              onItemClick: (final key) {
                drawerKey.currentState!.closeDrawer();

                setState(() {
                  if (key == 'home') {
                    changePage('home');
                    title = 'صفحه اصلی';
                  }
                });
              },
            ),
          ),
          sliderMain: Directionality(
            textDirection: TextDirection.rtl,
            child: navChildren[currentPage]!,
          )),
    );

  void changePage(final String activePage) {
    setState(() {
      currentPage = activePage;
    });
  }
}
