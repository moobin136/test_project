import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/view/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          splashController.clearListItem();
        },
        child: Icon(Icons.delete),
      ),
      appBar: CustomAppBar(
        title: 'Delivery by tomorrow 6 AM Onwards',
        subTitle: 'Tue , Aug 05',
        notificationIconData: Icon(Icons.cut_outlined),
        cutIconData: Icon(Icons.notification_add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: splashController.textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      splashController.addItem();
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Obx(
                () => ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  itemCount: splashController.itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Obx(
                          () => Text(
                            splashController.itemList[index],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () => splashController.removeItem(index),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
            child: notificationIconData),
        const SizedBox(width: 8),
        Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0x5F636F85)),
                color: const Color(0xFFFFFFFF),
                shape: BoxShape.circle),
            child: cutIconData),
        const SizedBox(width: 3),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
