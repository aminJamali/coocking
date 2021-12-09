import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final Function(String) onItemClick;

  const MenuWidget({required final this.onItemClick});

  @override
  Widget build(final BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        // ignore: prefer_const_constructors
        gradient: LinearGradient(
            colors: const [
              Color(0xFF3366FF),
              Color(0xFF00CCFF),
            ],
            // ignore: use_named_constants
            begin: const FractionalOffset(0.0, 0.0),
            // ignore: use_named_constants
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.decal),
      ),
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'کاچی',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          sliderItem('صفحه اصلی', Icons.home, 'home'),
          const Divider(
            height: 5,
            color: Colors.black54,
          ),
          sliderItem('درباره ما', Icons.list, 'about_us'),
          sliderItem('تماس با ما', Icons.call, 'contact_us'),
        ],
      ),
    );
  }

  Widget sliderItem(
          final String title, final IconData icons, final String key) =>
      ListTile(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          leading: Icon(
            icons,
            color: Colors.white,
          ),
          onTap: () {
            onItemClick(key);
          });
}
