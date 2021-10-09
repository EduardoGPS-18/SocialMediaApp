import 'dart:io';

abstract class SaveUserImage {
  Future<void> saveUserImage({
    required String userId,
    required File userImage,
  });
}
