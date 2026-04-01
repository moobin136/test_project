import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_project/view/splash_screen.dart';

class Slide extends StatelessWidget {
  const Slide({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: AppRoutes.instal,
      // getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // initialBinding: AppBinder(),
      themeMode: ThemeMode.light,
      home: SplashScreen(),
      // theme: ThemeData(
      //     brightness: Brightness.light,
      //     scaffoldBackgroundColor: AppColors.white),
    );
  }
}
