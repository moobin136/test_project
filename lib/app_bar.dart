import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCustomAppBar({super.key, required this.scaffoldKye});

  final GlobalKey<ScaffoldState> scaffoldKye;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      // leading: IconButton(
      //   icon: Icon(Icons.man_outlined),
      //   onPressed: () {
      //     scaffoldKye.currentState!.openDrawer();
      //   },
      // ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class MyCustomDrawer extends StatelessWidget {
  const MyCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.amber,
      clipBehavior: Clip.hardEdge,
      width: 310,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(
            color: Colors.blue,
            width: 2,
          )),
      // backgroundColor: const Color(0xFF851616),
      child: SafeArea(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28), color: Colors.amber),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: const Text('Moobin'),
            ),
          )
        ],
      )),
    );
  }
}
