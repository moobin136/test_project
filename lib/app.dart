import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_project/routs.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: DevicePreview.appBuilder, // Add the builder here
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouts.instal,
      getPages: AppRouts.pages,
      theme: ThemeData.light(),
    );
  }
}
