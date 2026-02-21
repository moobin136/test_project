import 'package:flutter/material.dart';
import 'package:test_project/ui/widgets/custom_task_card.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({super.key});

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 8),
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
    );
  }
}
