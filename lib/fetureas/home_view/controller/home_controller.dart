import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  RxDouble opacityValue = 0.4.obs;
  RxBool isSuccess = false.obs;

  RxString imagePath = ''.obs;

  /// image picker package
  final ImagePicker _picker = ImagePicker();

  RxList<String> itemList = [
    'I Love Bangladesh',
    'I Love India',
    'I Love Pakistan',
    'I Love US',
    'I Love UK',
    'I Love Russia',
    'I Love New',
    'I Love Kruzik',
  ].obs;

  RxList tempList = <String>[].obs;

  Rx<File?> selectedImage = Rx<File?>(null);

  // 📸 Camera
  Future<void> pickFromCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  // 🖼️ Gallery
  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    print('========================================= ${image.runtimeType}');

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void addListItem(int index) {
    if (tempList.contains(itemList[index])) {
      tempList.remove(itemList[index]);
    } else {
      tempList.add(itemList[index]);
    }
  }

  void changeOpacity(double value) {
    opacityValue.value = value;
    print(opacityValue.value.toStringAsFixed(1));
  }

  void changeSwitchValue(bool value) {
    isSuccess.value = value;
    print('Switch value: ${isSuccess.value}');
  }
}
