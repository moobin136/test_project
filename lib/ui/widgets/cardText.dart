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
      color: Colors.white,
      elevation: 0,
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                '$count',
                style: textThem.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              FittedBox(
                child: Text(
                  textAlign: TextAlign.center,
                  labelText,
                  style: textThem.titleMedium
                      ?.copyWith(color: Colors.grey, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
