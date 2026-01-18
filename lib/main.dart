import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_project/app_routes.dart';
import 'package:test_project/language.dart';
import 'package:test_project/size_config.dart';

import 'vi_sizer.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        builder: (context, child) {
          SizeConfig.init(context);
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
        translations: Language(),
        locale: const Locale('ur', 'PK'),
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.login,
        getPages: AppRoute.routes,
      );
    });
  }
}
