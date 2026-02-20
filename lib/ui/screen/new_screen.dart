import 'package:flutter/material.dart';
import 'package:test_project/ui/widgets/cardText.dart';
import 'package:test_project/ui/widgets/custom_task_card.dart';

import 'app_new_task_screen.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Column(
          children: [
            _bieldSumarySuction(textThem),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final _dateTime = DateTime.now();
                final month = _dateTime.month;
                final day = _dateTime.day;
                final year = _dateTime.year;
                return CustomTaskCard(
                  textThem: textThem,
                  title: 'Label task',
                  subTitle: 'Sub title',
                  dateTime: "$day/$month/$year",
                );
              },
            )),
            Text('New Screen'),
          ],
        ),
      ),
    );
  }

  Widget _bieldSumarySuction(TextTheme textThem) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TaskCardWithCount(
              textThem: textThem, labelText: 'New Task', count: 9),
          TaskCardWithCount(
              textThem: textThem, labelText: 'Completed', count: 16),
          TaskCardWithCount(
              textThem: textThem, labelText: 'Chancel', count: 18),
          TaskCardWithCount(
              textThem: textThem, labelText: 'Pending', count: 20),
          TaskCardWithCount(
              textThem: textThem, labelText: 'Pending', count: 20),
        ],
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
