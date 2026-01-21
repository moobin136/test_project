import 'package:flutter/material.dart';
import 'package:test_project/app_bar.dart';
import 'package:test_project/my_custom_bt_nav.dart';
import 'package:test_project/my_custom_floating_action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //from kye
    final GlobalKey<ScaffoldState> scaffoldKye = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKye,
        drawer: const MyCustomDrawer(),
        appBar: MyCustomAppBar(scaffoldKye: scaffoldKye),
        floatingActionButton: MyCustomFloatingActionButton(),
        bottomNavigationBar: const MyCustomNavBar());
  }
}

class MyCustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MyCustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Custom color
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(label, style: TextStyle(fontSize: 18)),
    );
  }
}
