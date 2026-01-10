import 'package:get/get.dart';
import 'package:test_project/home_view';
import 'package:test_project/login_view.dart';




class AppPages {
  static const login = '/login';
  static const home = '/home';

  static final routes = [
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: home, page: () => HomeView()),
  ];
}
