import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AccessDeniedPage extends StatelessWidget {

  const AccessDeniedPage({final Key? key}) : super(key: key);
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('منطقه ممنوعه')),
        body: const Center(child: Icon(Icons.no_accounts)),
        // body: Center(
        //   child: SizedBox(
        //     width: Get.width - 100,
        //     child: SvgPicture.asset(
        //       'assets/403.svg',
        //       package: 'attendance_module',
        //       fit: BoxFit.contain,
        //       allowDrawingOutsideViewBox: true,
        //       cacheColorFilter: false,
        //     ),
        //   ),
        // ),
      );
}
