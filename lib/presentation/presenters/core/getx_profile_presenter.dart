import 'dart:io';

import 'package:get/get.dart';

import '../../../data/firebase/firebase.dart';
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

  @override
  Future<void> loadPageData() async {
    try {
      updateUserId();

      final posts = await remoteGetPublishesByUserID.getPublishesByUserID(userId: _userId);
      postsCountController.value = posts.length;

      final userData = await remoteLoadUser.loadUserByUID(uid: _userId).first;
      userDataController.value = userData;
    } on FirebaseCloudFirestoreError catch (_) {
      handlingErrorsStreamController.subject.add(R.string.msgInvalidCredentials);
    } catch (_) {
      handlingErrorsStreamController.subject.add("Ocorreu um erro!");
    }
  }

  Rx<String> handlingErrorsStreamController = Rx<String>("");
  @override
  Stream<String> get handlingError => handlingErrorsStreamController.stream;

  final RxInt postsCountController = 0.obs;
  @override
  Stream<int> get postsCount => postsCountController.stream;

  @override
  void updateUserId() {
    _userId = localGetUserId.getUserId() ?? '';
  }

  Rx<UserEntity> userDataController = const UserEntity(uid: '', email: '', name: '', photoUrl: '').obs;
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
    remoteSaveUserImage.saveUserImage(userId: localGetUserId.getUserId()!, userImage: image);
    _userImageErrorStreamController.value = _validateField('image');
    if (error == UIError.noError) {
      // remoteSaveUserImage.saveUserImage(userId: userId, userImage: userImage);
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
  Stream<UserEntity> get user => remoteLoadUser.loadUserByUID(uid: localGetUserId.getUserId() ?? "");
}
