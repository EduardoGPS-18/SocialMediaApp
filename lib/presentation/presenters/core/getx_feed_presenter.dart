import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../domain/entities/publish_entity.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/auth.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/helpers/helpers.dart';
import '../../../ui/pages/pages.dart';
import '../../protocols/protocols.dart';
import '../shared/shared.dart';

class GetxFeedPresenter extends GetxController with UpdateUserId, NavigationImpl implements FeedPresenter {
  AddPublish remoteAddPublish;
  LoadUser remoteLoadUser;
  @override
  GetUserId localGetUserId;
  LoadRecentPublishes remoteLoadRecentPublishes;
  LikePublish remoteLikePublish;
  UnlikePublish remoteUnlikePublish;
  LoadPublish remoteLoadPublish;

  DeletePublish deletePublish;

  Rx<String> userCommunicateStreamController = Rx("");
  @override
  Stream<String> get userCommunicateStream => userCommunicateStreamController.stream;
  Rx<List<PublishEntity>> publishStreamController = Rx([]);

  Validation validation;

  String _publishContent = "";
  String? _userId;
  @override
  String? get userId => _userId;
  @override
  set userId(String? userId) => _userId = userId;

  @override
  Stream<List<PublishEntity>> get publishStream => remoteLoadRecentPublishes.getPublishesByDate(date: DateTime.now().subtract(const Duration(days: 7)));

  GetxFeedPresenter({
    required this.remoteLoadUser,
    required this.localGetUserId,
    required this.remoteLoadRecentPublishes,
    required this.remoteLikePublish,
    required this.remoteUnlikePublish,
    required this.remoteLoadPublish,
    required this.remoteAddPublish,
    required this.validation,
    required this.deletePublish,
  });

  @override
  Stream<UserEntity> get user {
    updateUserId();
    return remoteLoadUser.loadUserByUID(uid: _userId!);
  }

  @override
  Stream<UserEntity> loadUserEntityById({required String uid}) => remoteLoadUser.loadUserByUID(uid: uid);

  Rx<UIError> publishErrorStreamController = Rx(UIError.noError);
  @override
  Stream<UIError> get publishErrorStream => publishErrorStreamController.stream;

  @override
  Rx<String> errorStreamController = Rx("");
  @override
  Stream<String> get errorStream => errorStreamController.stream;

  Rx<bool> isValidPublishStreamController = Rx(false);
  @override
  Stream<bool> get isValidPublish => isValidPublishStreamController.stream;

  @override
  void validPublishContent(String value) {
    _publishContent = value;
    publishErrorStreamController.value = _validateField('publish_content');
    _validateForm();
  }

  @override
  void likeClick({required String publishId}) async {
    try {
      updateUserId();
      final publish = await remoteLoadPublish.findPublishById(publishId: publishId).first;
      final currentUser = await (user).first;
      final currentUserId = currentUser.uid;
      publish.uidOfWhoLikedIt.contains(currentUserId)
          ? await remoteUnlikePublish.unlikePublish(params: UnlikePublishParams(userId: currentUserId, publishId: publishId))
          : await remoteLikePublish.likePublish(params: LikePublishParams(userId: currentUserId, publishId: publishId));
    } catch (e) {
      errorStreamController.subject.add(R.string.msgUnexpectedError);
    }
  }

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
      _publishContent = '';
      publishController.clear();
      _validateForm();
    } catch (_) {
      errorStreamController.subject.add(R.string.msgUnexpectedError);
    }
  }

  void _validateForm() {
    final isValid = _publishContent.isNotEmpty && publishErrorStreamController.value == UIError.noError;
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

  TextEditingController publishController = TextEditingController();
  @override
  TextEditingController get publishTextFieldController => publishController;
  @override
  Future<void> removePublish({required String publishId}) async {
    try {
      await deletePublish.deletePublish(publishId: publishId);
      userCommunicateStreamController.subject.add(R.string.successOnDelete);
    } catch (_) {
      errorStreamController.subject.add(R.string.msgUnexpectedError);
    }
  }
}
