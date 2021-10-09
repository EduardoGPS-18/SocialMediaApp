import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../data/firebase/firebase.dart';
import '../../../ui/helpers/helpers.dart';
import '../../protocols/protocols.dart';
import '../../../domain/entities/publish_entity.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/auth.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';

class GetxFeedPresenter extends GetxController implements FeedPresenter {
  AddPublish remoteAddPublish;
  LoadUser remoteLoadUser;
  GetUserId localGetUserId;
  LoadRecentPublishes remoteLoadRecentPublishes;
  LikePublish remoteLikePublish;
  UnlikePublish remoteUnlikePublish;
  LoadPublish remoteLoadPublish;

  DeletePublish deletePublish;

  Rx<String> userCommunicateStreamController = Rx("");
  @override
  Stream<String> get userCommunicateStream =>
      userCommunicateStreamController.stream;
  Rx<List<PublishEntity>> publishStreamController = Rx([]);

  Validation validation;

  String _publishContent = "";

  @override
  Stream<List<PublishEntity>> get publishStream =>
      remoteLoadRecentPublishes.getPublishesByDate(
          date: DateTime.now().subtract(const Duration(days: 7)));

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
  Stream<UserEntity> get user =>
      remoteLoadUser.loadUserByUID(uid: localGetUserId.getUserId() ?? "");

  @override
  Stream<UserEntity> loadUserEntityById({required String uid}) =>
      remoteLoadUser.loadUserByUID(uid: uid);

  Rx<UIError> errorStreamController = Rx(UIError.noError);
  @override
  Stream<UIError> get errorStream => errorStreamController.stream;

  Rx<bool> isValidPublishStreamController = Rx(false);
  @override
  Stream<bool> get isValidPublish => isValidPublishStreamController.stream;

  @override
  void validPublishContent(String value) {
    _publishContent = value;
    errorStreamController.value = _validateField('publish_content');
    _validateForm();
  }

  @override
  void likeClick({required String publishId}) async {
    final publish =
        await remoteLoadPublish.findPublishById(publishId: publishId).first;
    final currentUser = await (user).first;
    final currentUserId = currentUser.uid;
    publish.uidOfWhoLikedIt.contains(currentUserId)
        ? await remoteUnlikePublish.unlikePublish(
            params: UnlikePublishParams(
                userId: currentUserId, publishId: publishId))
        : await remoteLikePublish.likePublish(
            params:
                LikePublishParams(userId: currentUserId, publishId: publishId));
  }

  @override
  Future<void> addPublish() async {
    final userId = localGetUserId.getUserId();
    if (userId == null) return;
    try {
      await remoteAddPublish.addPublish(
        params: AddPublishParams(
          content: _publishContent,
          userId: userId,
        ),
      );
      _publishContent = '';
      publishController.clear();
      _validateForm();
    } on FirebaseCloudFirestoreError catch (_) {
      rethrow;
    }
  }

  void _validateForm() {
    final isValid = _publishContent.isNotEmpty &&
        errorStreamController.value == UIError.noError;
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
  Future<void> removePublish({required String publishId}) async {
    try {
      await deletePublish.deletePublish(publishId: publishId);
      userCommunicateStreamController.subject.add(R.string.successOnDelete);
    } catch (_) {}
  }
}
