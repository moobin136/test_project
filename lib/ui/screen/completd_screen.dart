import 'package:flutter/material.dart';
import 'package:test_project/ui/widgets/custom_task_card.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: 5,
      itemBuilder: (context, index) {
        final dateTime = DateTime.now();
        final month = dateTime.month;
        final day = dateTime.day;
        final year = dateTime.year;
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
