import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/constant/app_colors.dart';
import 'package:test_project/features/home_view/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    print('rebelled');
    return Scaffold(
      appBar: AppBar(
        title: Text('FavIconChange'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: AppColors.gray.withAlpha(8),
                    child: ListTile(
                      onTap: () {
                        controller.toggleItem(controller.dataList[index]);
                        print(controller.emptyList);
                      },
                      title: Text(controller.dataList[index]),
                      trailing: Obx(
                        () => Icon(
                          Icons.favorite,
                          color: controller.emptyList
                                  .contains(controller.dataList[index])
                              ? AppColors.red
                              : const Color.fromARGB(255, 27, 25, 19),
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
    );
  }
}
