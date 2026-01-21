import 'package:flutter/material.dart';

class MyCustomNavBar extends StatelessWidget {
  const MyCustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.alarm_add), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.navigation), label: 'Home'),
      ],
    );
  }
}
