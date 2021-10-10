import 'dart:io';

import 'package:get/get.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/helpers/helpers.dart';
import '../../../ui/pages/pages.dart';
import '../../protocols/protocols.dart';
import '../shared/shared.dart';

class GetxProfilePresenter extends GetxController with UpdateUserId implements ProfilePresenter {
  @override
  final GetUserId localGetUserId;
  final LoadPublishesByUserID remoteGetPublishesByUserID;
  final GetImage localGetImage;
  final Validation validation;
  final LoadUser remoteLoadUser;
  final SaveUserImage remoteSaveUserImage;

  File? _userImage;

  String? _userId;

  @override
  String? get userId => _userId;
  @override
  set userId(String? userId) => _userId = userId;

  GetxProfilePresenter({
    required this.localGetUserId,
    required this.remoteGetPublishesByUserID,
    required this.localGetImage,
    required this.validation,
    required this.remoteLoadUser,
    required this.remoteSaveUserImage,
  });

  @override
  Rx<String> errorStreamController = Rx<String>("");
  @override
  Stream<String> get errorStream => errorStreamController.stream;

  final RxInt postsCountController = 0.obs;
  @override
  Stream<int> get postsCount {
    updateUserId();
    return remoteGetPublishesByUserID.getPublishesByUserID(userId: _userId!).map((event) => event.length);
  }

  @override
  Future<void> setImage() async {
    try {
      File? image = await localGetImage.getImage();
      _userImage = image;
      userImageStreamController.subject.add(image);
      var error = _validateField('image');

      if (image == null) {
        return;
      }
      updateUserId();

      remoteSaveUserImage.saveUserImage(userId: _userId!, userImage: image);
      _userImageErrorStreamController.value = _validateField('image');
      if (error == UIError.noError && _userImage != null) {
        remoteSaveUserImage.saveUserImage(userId: _userId!, userImage: _userImage!);
      }
    } catch (e) {
      errorStreamController.subject.add(R.string.msgUnexpectedError);
    }
  }

  Rx<File?> userImageStreamController = Rx<File?>(null);
  @override
  Stream<File?> get userImage => userImageStreamController.stream;
  final Rx<UIError> _userImageErrorStreamController = (UIError.unexpected).obs;
  @override
  Stream<UIError> get userImageError => _userImageErrorStreamController.stream;

  UIError _validateField(String field) {
    final formData = {
      'image': _userImage?.path,
    };
    final error = validation.validate(field: field, input: formData);

    switch (error) {
      case ValidationError.invalidField:
        return UIError.invalidField;
      case ValidationError.requiredField:
        return UIError.requiredField;
      case ValidationError.noError:
        return UIError.noError;
    }
  }

  @override
  Stream<UserEntity> get user {
    updateUserId();
    return remoteLoadUser.loadUserByUID(uid: _userId!);
  }
}
