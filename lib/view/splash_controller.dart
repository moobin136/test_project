import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  RxList<String> itemList = <String>[].obs;

  RxList<String> wightsList = <String>['One', 'Tow', 'Three', 'Fore'].obs;

  RxList<Map<String, dynamic>> productList = <Map<String, dynamic>>[
    {'name': 'শার্ট', 'price': 500},
    {'name': 'প্যান্ট', 'price': 800},
    {'name': 'Genji', 'price': 400},
    {'name': 'Rani', 'price': 1000},
  ].obs;

  addItem() {
    if (textEditingController.text.isNotEmpty) {
      itemList.add(textEditingController.text);
      textEditingController.clear();
    }
  }

  removeItem(int index) {
    itemList.removeAt(index);
  }

  clearListItem() {
    itemList.clear();
  }
}
