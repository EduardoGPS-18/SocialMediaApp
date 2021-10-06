import 'dart:io';

abstract class FirebaseStore {
  Future<String> saveImageOfPath({required SaveImageParams params});
}

class SaveImageParams {
  final String path;
  final File file;
  SaveImageParams({
    required this.path,
    required this.file,
  });
}
