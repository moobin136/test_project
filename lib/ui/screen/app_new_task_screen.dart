import 'package:flutter/material.dart';
import 'package:test_project/ui/widgets/global_appbar.dart';

class AppNewTaskScreen extends StatefulWidget {
  const AppNewTaskScreen({super.key});

  @override
  State<AppNewTaskScreen> createState() => _AppNewTaskScreenState();
}

class _AppNewTaskScreenState extends State<AppNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      appBar: const TMAppBar(),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom * 0.6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45),
              Text(
                'Add New Task',
                style:
                    textThem.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              _buildAddNewTaskFrom(textThem),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddNewTaskFrom(TextTheme textThem) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(hintText: 'New Task'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(hintText: 'Description'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onTapAddNewTask,
          child: Text(
            'Add',
            style: textThem.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _onTapAddNewTask() {
    //TODO :
  }
}
