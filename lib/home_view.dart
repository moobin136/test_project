import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/size_config.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Language Change',
          style: TextStyle(fontSize: 22.sp),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'message'.tr,
              style: TextStyle(fontSize: 20.sp),
            ),
            subtitle: Text(
              'fatherName'.tr,
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('en', 'US'));
                  },
                  child: Text('EN')),
              SizedBox(width: 16),
              ElevatedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('ur', 'PK'));
                  },
                  child: Text('UR'))
            ],
          )
        ],
      ),
    );
  }
}
