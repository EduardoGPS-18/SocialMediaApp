import 'dart:io';
import 'package:get/get.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/helpers/helpers.dart';
import '../../../ui/pages/pages.dart';
import '../../protocols/protocols.dart';

class GetxProfilePresenter extends GetxController implements ProfilePresenter {
  final GetUserId localGetUserId;
  final LoadPublishesByUserID remoteGetPublishesByUserID;
  final GetImage localGetImage;
  final Validation validation;
  final LoadUser remoteLoadUser;
  final SaveUserImage remoteSaveUserImage;

  File? _userImage;

  String _userId = '';

  GetxProfilePresenter(
      {required this.localGetUserId,
      required this.remoteGetPublishesByUserID,
      required this.localGetImage,
      required this.validation,
      required this.remoteLoadUser,
      required this.remoteSaveUserImage});

  Rx<String> handlingErrorsStreamController = Rx<String>("");
  @override
  Stream<String> get handlingError => handlingErrorsStreamController.stream;

  final RxInt postsCountController = 0.obs;
  @override
  Stream<int> get postsCount => remoteGetPublishesByUserID
      .getPublishesByUserID(userId: _userId)
      .map((event) => event.length);

  @override
  void updateUserId() {
    _userId = localGetUserId.getUserId() ?? '';
  }

  Rx<UserEntity> userDataController =
      const UserEntity(uid: '', email: '', name: '', photoUrl: '').obs;
  @override
  Stream<UserEntity> get userData => userDataController.stream;

  @override
  Future<void> setImage() async {
    File? image = await localGetImage.getImage();
    _userImage = image;
    userImageStreamController.subject.add(image);
    var error = _validateField('image');
    if (localGetUserId.getUserId() == null || image == null) {
      throw "Error";
    }
    remoteSaveUserImage.saveUserImage(
        userId: localGetUserId.getUserId()!, userImage: image);
    _userImageErrorStreamController.value = _validateField('image');
    if (error == UIError.noError && _userImage != null) {
      remoteSaveUserImage.saveUserImage(
          userId: _userId, userImage: _userImage!);
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
  Stream<UserEntity> get user => remoteLoadUser.loadUserByUID(uid: _userId);
}
