import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModifyMaterialController extends GetxController{
  GlobalKey<FormState> modifyMaterialFormKey = GlobalKey<FormState>();
  String submitLabel='ثبت';
  void submitTaped(){}
void titleSaved(final String title){
  print(title);
}
void unitSaved(final String unit){}
void countSaved(final String count){}
  List<String> unitItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
}