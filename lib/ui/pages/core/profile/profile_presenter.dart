import 'dart:io';
import '../../../helpers/helpers.dart';
import '../../../../domain/entities/entities.dart';

abstract class ProfilePresenter {
  Stream<UserEntity> get userData;
  Stream<int> get postsCount;
  Stream<File?> get userImage;
  Stream<UIError> get userImageError;
  Stream<String> get handlingError;

  void setImage();

  void updateUserId();
  Future<void> loadPageData();
}
