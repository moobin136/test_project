import 'package:flutter/material.dart';

class TaskCardWithCount extends StatelessWidget {
  const TaskCardWithCount({
    super.key,
    required this.textThem,
    required this.labelText,
    required this.count,
  });

  final TextTheme textThem;
  final String labelText;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          textAlign: TextAlign.center,
          '${count}6\n$labelText',
          style: textThem.titleMedium,
        ),
      ),
    );
  }
}
