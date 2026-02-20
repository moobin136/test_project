import 'package:flutter/material.dart';

class CustomTaskCard extends StatelessWidget {
  const CustomTaskCard({
    super.key,
    required this.textThem,
    this.title,
    this.subTitle,
    this.dateTime,
  });

  final TextTheme textThem;
  final String? title;
  final String? subTitle;
  final dynamic? dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toString(),
              style: textThem.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              subTitle.toString(),
              style: textThem.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF383838),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              dateTime,
              style: textThem.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF383838),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadiusDirectional.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22.0, vertical: 4),
                    child: Text(
                      'New',
                      style: textThem.labelLarge,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit, color: Colors.green),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
