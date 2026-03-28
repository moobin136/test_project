import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/fetureas/home_view/controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    print('rebield');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return Container(
                  height: 200,
                  width: 230,
                  color: Colors.blue.withOpacity(controller.opacityValue.value),
                );
              }),
              Obx(
                () {
                  return Slider(
                    value: controller.opacityValue.value,
                    onChanged: controller.changeOpacity,
                  );
                },
              ),
              Obx(
                () {
                  return Text(
                    controller.opacityValue.value.toStringAsFixed(1),
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
              const SizedBox(height: 16),
              Obx(
                () {
                  return Switch.adaptive(
                    value: controller.isSuccess.value,
                    onChanged: controller.changeSwitchValue,
                  );
                },
              ),
              const SizedBox(height: 16),
              Obx(
                () {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    itemCount: controller.itemList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.addListItem(index);
                        },
                        child: Obx(
                          () {
                            return Card(
                              elevation: 0,
                              color: (controller.tempList.contains(
                                      controller.itemList[index].toString()))
                                  ? Colors.amber
                                  : Colors.grey.withOpacity(0.3),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                child: Row(
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller.itemList[index].toString(),
                                        style: TextStyle(
                                          color: (controller.tempList.contains(
                                            controller.itemList[index]
                                                .toString(),
                                          ))
                                              ? Colors.black
                                              : Colors.black87,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Obx(
                                      () {
                                        return Icon(
                                          Icons.favorite,
                                          color: controller.tempList.contains(
                                                  controller.itemList[index])
                                              ? Colors.red
                                              : Colors.transparent,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              // 🖼️ Preview
              Obx(() {
                return controller.selectedImage.value != null
                    ? Image.file(
                        controller.selectedImage.value!,
                        height: 200,
                        width: 280,
                        fit: BoxFit.cover,
                      )
                    : const Text("No Image Selected");
              }),

              const SizedBox(height: 16),
              Row(
                children: [
                  const Spacer(flex: 4),
                  IconButton.filledTonal(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    onPressed: controller.pickFromCamera,
                    icon: Icon(Icons.camera_alt_outlined),
                  ),
                  const Spacer(),
                  IconButton.filledTonal(
                    color: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    onPressed: controller.pickFromGallery,
                    icon: Icon(Icons.folder),
                  ),
                  const Spacer(flex: 4),
                ],
              ),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}
