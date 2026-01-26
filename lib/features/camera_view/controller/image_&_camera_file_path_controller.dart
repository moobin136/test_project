import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageAndCameraFilePathController extends GetxController {
  RxString filePath = ''.obs;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> imagePicToCamera() async {
    final imagePath = await _imagePicker.pickImage(source: ImageSource.camera);
    if (imagePath != null) {
      filePath.value = imagePath.path;
    }
  }

  Future imagePicToGallery() async {
    final imagePath = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePath != null) {
      filePath.value = imagePath.path;
    }
  }
}
