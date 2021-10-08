import 'dart:io';

import '../../../../domain/entities/entities.dart';

abstract class ProfilePresenter {
  Stream<UserEntity> get userData;
  Stream<int> get postsCount;
  Stream<File?> get userImage;

  void setPageIndex(int value);
  void setImage();
  Future<void> loadUserData();
}
