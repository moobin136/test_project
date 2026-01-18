import 'package:get/get.dart';
import 'home_view.dart';

class AppPages {
  static const login = '/';
  static const home = '/home';

  static final routes = [
    GetPage(name: login, page: () => HomeView()),
  ];
}
