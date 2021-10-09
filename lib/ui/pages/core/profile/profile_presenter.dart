import 'dart:io';

import '../../../../domain/entities/entities.dart';
import '../../../helpers/helpers.dart';

abstract class ProfilePresenter {
  Stream<UserEntity> get userData;
  Stream<int> get postsCount;
  Stream<File?> get userImage;
  Stream<UIError> get userImageError;
  Stream<String> get handlingError;
  Stream<UserEntity> get user;

  void setImage();

  void updateUserId();
}
