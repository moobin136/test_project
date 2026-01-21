import 'package:flutter/material.dart';

class MyCustomFloatingActionButton extends StatelessWidget {
  const MyCustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 8,
      // ignore: deprecated_member_use
      backgroundColor: Colors.grey.withAlpha(95),
      onPressed: () {},
      child: Icon(Icons.repeat_rounded),
    );
  }
}
