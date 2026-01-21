import 'package:flutter/material.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            brightness: Brightness.light, onSurface: Colors.black),
        useMaterial3: true,
      ),
      color: Colors.amber,
      home: const HomePage(),
    );
  }
}
