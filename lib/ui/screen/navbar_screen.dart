import 'package:flutter/material.dart';
import 'package:test_project/ui/screen/chancel_screen.dart';
import 'package:test_project/ui/screen/completd_screen.dart';
import 'package:test_project/ui/screen/new_screen.dart';
import 'package:test_project/ui/screen/pending_screen.dart';
import 'package:test_project/ui/util/app_colors.dart';

import '../widgets/global_appbar.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 0;

  //navbar chang function
  void _changIndex(int newIndex) {
    _selectedIndex = newIndex;
    setState(() {});
  }

  final List<Widget> _screenList = const [
    NewScreen(),
    CompleteScreen(),
    ChancelScreen(),
    PendingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppbar(),
      body: _screenList[_selectedIndex],
      bottomNavigationBar: buildNavigationBar(),
    );
  }

  Widget buildNavigationBar() {
    return NavigationBar(
      // backgroundColor: AppColors.themColor.withAlpha(99),
      indicatorColor: Colors.white,
      selectedIndex: _selectedIndex,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      onDestinationSelected: _changIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(
            Icons.fiber_new_outlined,
          ),
          label: 'New',
        ),
        NavigationDestination(
          icon: Icon(Icons.cloud_done),
          label: 'Completed',
        ),
        NavigationDestination(
          icon: Icon(Icons.close_outlined),
          label: 'Chancel',
        ),
        NavigationDestination(
          icon: Icon(Icons.hourglass_bottom_outlined),
          label: 'Pending',
        ),
      ],
    );
  }
}
