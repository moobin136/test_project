import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     throw InternetException();
      //   },
      //   child: Icon(Icons.add),
      // ),
      appBar: CustomAppBar(
        title: 'Delivery by tomorrow 6 AM Onwards',
        subTitle: 'Tue , Aug 05',
        notificationIconData: Icon(Icons.cut_outlined),
        cutIconData: Icon(Icons.notification_add),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: <Widget>[
                TextFormField(),
                const SizedBox(width: 16),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2196F3),
                  ),
                  child: Row(
                    children: <Widget>[
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    this.notificationCounter,
    this.notificationCounterBuy,
    required this.notificationIconData,
    required this.cutIconData,
  });

  final String title;
  final String subTitle;
  final String? notificationCounter;
  final String? notificationCounterBuy;
  final Widget notificationIconData;
  final Widget cutIconData;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Wrap(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                subTitle,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
      actions: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0x5F636F85)),
              color: const Color(0xFFFFFFFF),
              shape: BoxShape.circle),
          child: notificationIconData
        ),
        const SizedBox(width: 8),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0x5F636F85)),
              color: const Color(0xFFFFFFFF),
              shape: BoxShape.circle),
          child: cutIconData
        ),
        const SizedBox(width: 3),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
