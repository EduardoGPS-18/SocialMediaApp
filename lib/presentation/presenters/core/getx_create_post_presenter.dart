import 'package:get/get.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/post/post.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/helpers/helpers.dart';
import '../../../ui/pages/pages.dart';
import '../../protocols/protocols.dart';

class GetxCreatePostPresenter extends GetxController implements CreatePostPresenter {
  AddPublish remoteAddPublish;

  @override
  GetUserId localGetUserId;
  LoadUser remoteLoadUser;
  Validation validation;

  String? _userId;

  @override
  void updateUserId() {
    try {
      _userId = localGetUserId.getUserId();
      if (_userId == null) {
        Get.offAllNamed('/auth');
      }
    } catch (_) {
      Get.offAllNamed('/auth');

      errorStreamController.subject.add(R.string.expiredUser);
    }
  }

  String _publishContent = "";

  Rx<UIError> postErrorStreamController = Rx(UIError.noError);
  @override
  Stream<UIError> get postErrorStream => postErrorStreamController.stream;
  Rx<bool> isValidPublishStreamController = Rx(false);
  @override
  Stream<bool> get isValidPublish => isValidPublishStreamController.stream;
  @override
  Rx<String> errorStreamController = Rx("");
  @override
  Stream<String> get errorStream => errorStreamController.stream;

  GetxCreatePostPresenter({
    required this.remoteAddPublish,
    required this.localGetUserId,
    required this.remoteLoadUser,
    required this.validation,
  });

  @override
  Future<void> addPublish() async {
    try {
      updateUserId();

      await remoteAddPublish.addPublish(
        params: AddPublishParams(
          content: _publishContent,
          userId: _userId!,
        ),
      );
    } catch (e) {
      errorStreamController.subject.add(R.string.msgUnexpectedError);
    }
  }

  @override
  Stream<UserEntity>? get user {
    updateUserId();
    print(_userId);
    return remoteLoadUser.loadUserByUID(uid: _userId!);
  }

  @override
  void validPublishContent(String value) {
    _publishContent = value;
    postErrorStreamController.value = _validateField('publish_content');
    _validateForm();
  }

  void _validateForm() {
    final isValid = _publishContent.isNotEmpty && postErrorStreamController.value == UIError.noError;
    isValidPublishStreamController.subject.add(isValid);
  }

  UIError _validateField(String field) {
    final formData = {
      'publish_content': _publishContent,
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
}
