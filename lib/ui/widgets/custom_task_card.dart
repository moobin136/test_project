import 'package:flutter/material.dart';

class CustomTaskCard extends StatefulWidget {
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
  final dynamic dateTime;

  @override
  State<CustomTaskCard> createState() => _CustomTaskCardState();
}

class _CustomTaskCardState extends State<CustomTaskCard> {
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
              widget.title.toString(),
              style: widget.textThem.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.subTitle.toString(),
              style: widget.textThem.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF383838),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.dateTime,
              style: widget.textThem.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF383838),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTaskStatusText(),
                Row(
                  children: [
                    IconButton(
                      onPressed: onPressedEditDialog,
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

  void onPressedEditDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
              mainAxisSize: MainAxisSize.min,
              children: ['New', 'Completed', 'Chancel', 'Pending'].map(
                (e) {
                  return ListTile(
                    onTap: () {},
                    title: Text(e),
                  );
                },
              ).toList()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void _onTapDeletButton() {}

  Widget _buildTaskStatusText() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 4),
        child: Text(
          'New',
          style: widget.textThem.labelLarge,
        ),
      ),
    );
  }
}
