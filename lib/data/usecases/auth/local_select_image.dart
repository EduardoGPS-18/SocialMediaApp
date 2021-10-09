import 'dart:io';

import '../../../domain/usecases/auth/auth.dart';
import '../../local/local.dart';

class LocalSelectImage implements GetImage {
  SelectLocalImage selectLocalImage;

  LocalSelectImage({required this.selectLocalImage});

  @override
  Future<File?> getImage() async {
    try {
      return await selectLocalImage.takeAPicture();
    } catch (_) {
      rethrow;
    }
  }
}
