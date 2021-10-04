import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../data/local/local.dart';

class SelectLocalImageAdapter implements SelectLocalImage {
  ImagePicker imagePicker;
  SelectLocalImageAdapter({
    required this.imagePicker,
  });

  @override
  Future<File> takeAPicture() async {
    final selectedImage = await imagePicker.pickImage(source: ImageSource.camera);
    return File(selectedImage?.path ?? "");
  }
}
