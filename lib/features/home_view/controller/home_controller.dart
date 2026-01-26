import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<String> dataList = [
    'My name is Moobin',
    'My fav Icon Is Love',
    'My fav eats egg',
    'My fav gm is VDGm'
  ].obs;
  RxList emptyList = [].obs;

  void addItem(String value) {
    emptyList.add(value);
  }

  void removeItem(String value) {
    emptyList.remove(value);
  }

  void toggleItem(String value) {
    if (emptyList.contains(value)) {
      emptyList.remove(value);
    } else {
      emptyList.add(value);
    }
  }
}
