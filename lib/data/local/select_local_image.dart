import 'dart:io';

abstract class SelectLocalImage {
  Future<File?> takeAPicture();
}
