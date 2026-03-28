import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class Slide extends StatelessWidget {
  const Slide({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: AppRoutes.instal,
      // getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
      // initialBinding: AppBinder(),
      themeMode: ThemeMode.light,
      // theme: ThemeData(
      //     brightness: Brightness.light,
      //     scaffoldBackgroundColor: AppColors.white),
    );
  }
}
