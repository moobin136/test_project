import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/image_&_camera_file_path_controller.dart';

class ImageAndCameraFilePath extends GetView<ImageAndCameraFilePathController> {
  const ImageAndCameraFilePath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Obx(
        () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: controller.filePath.value.isNotEmpty
                    ? FileImage(File(controller.filePath.value))
                    : null,
                backgroundColor: Colors.grey[300],
                child: controller.filePath.value.isEmpty
                    ? const Icon(Icons.person, size: 80, color: Colors.white)
                    : null,
              ),
              const SizedBox(height: 16),
              TextButton(
                child: const Text('Camera'),
                onPressed: () {
                  controller.imagePicToCamera();
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                child: const Text('Gallery'),
                onPressed: () {
                  controller.imagePicToGallery();
                },
              )
            ],
          );
        },
      )),
    );
  }
}
