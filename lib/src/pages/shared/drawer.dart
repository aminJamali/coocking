import 'package:cooking/src/pages/admin/main/views/admin_page.dart';
import 'package:cooking/src/pages/shared/views/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class DrawerScreen extends StatefulWidget {
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
    title = "صفحه اصلی";
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SliderMenuContainer(
          drawerIconColor: Colors.white,
          appBarColor: Colors.blue,
          hasAppBar: true,
          slideDirection: SlideDirection.RIGHT_TO_LEFT,
          key: drawerKey,
          sliderMenuOpenSize: 200,
          title: Text(
            this.title!,
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
                    chanePage('home');
                    this.title = 'صفحه اصلی';
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
  }

  // ignore: prefer_final_parameters
  void chanePage(String activePage) {
    setState(() {
      currentPage = activePage;
    });
  }
}
