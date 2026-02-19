import 'package:flutter/material.dart';
import 'package:test_project/ui/util/app_colors.dart';

import 'app_new_task_screen.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(),
      body: Center(
        child: Text('New Screen'),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: _addNewTaskScreen,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  void _addNewTaskScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AppNewTaskScreen(),
      ),
    );
  }
}
