import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  RxList<String> itemList = <String>[].obs;

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
