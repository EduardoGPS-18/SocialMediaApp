import 'package:get/get.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/post/post.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/helpers/helpers.dart';
import '../../../ui/pages/pages.dart';
import '../../protocols/protocols.dart';

class GetxCreatePostPresenter extends GetxController implements CreatePostPresenter {
  AddPublish remoteAddPublish;
  GetUserId localGetUserId;
  LoadUser remoteLoadUser;

  Validation validation;

  String _publishContent = "";

  Rx<UIError> errorStreamController = Rx(UIError.noError);
  @override
  Stream<UIError> get errorStream => errorStreamController.stream;
  Rx<bool> isValidPublishStreamController = Rx(false);
  @override
  Stream<bool> get isValidPublish => isValidPublishStreamController.stream;

  GetxCreatePostPresenter({
    required this.remoteAddPublish,
    required this.localGetUserId,
    required this.remoteLoadUser,
    required this.validation,
  });

  @override
  Future<void> addPublish() async {
    final userId = localGetUserId.getUserId();
    if (userId == null) return;

    remoteAddPublish.addPublish(
      params: AddPublishParams(
        content: _publishContent,
        userId: userId,
      ),
    );
  }

  @override
  Future<UserEntity> get user async {
    final userId = localGetUserId.getUserId();
    if (userId == null) {
      throw "Error!";
    }
    return remoteLoadUser.loadUserByUID(uid: userId);
  }

  @override
  void validPublishContent(String value) {
    _publishContent = value;
    errorStreamController.value = _validateField('publish_content');
    _validateForm();
  }

  void _validateForm() {
    final isValid = _publishContent.isNotEmpty && errorStreamController.value == UIError.noError;
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
