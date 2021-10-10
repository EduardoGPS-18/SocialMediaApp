import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/firebase/firebase.dart';
import '../../../domain/entities/comment_entity.dart';
import '../../../domain/entities/publish_entity.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/auth.dart';
import '../../../domain/usecases/post/comment/load_comments.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/helpers/helpers.dart';
import '../../../ui/pages/post/post_presenter.dart';
import '../../protocols/protocols.dart';
import '../shared/shared.dart';

class GetxPostPresenter extends GetxController with UpdateUserId implements PostPresenter {
  LoadUser remoteLoadUser;
  @override
  GetUserId localGetUserId;
  LoadPublish remoteLoadPublish;
  AddComment remoteAddComment;
  Validation validation;
  LoadComments remoteLoadComments;
  LikePublish remoteLikePublish;
  UnlikePublish remoteUnlikePublish;
  DeleteComment remoteDeleteComment;

  String? _userId;
  @override
  String? get userId => _userId;
  @override
  set userId(String? v) => _userId = v;

  Rx<UIError> commentErrorStreamController = Rx(UIError.noError);
  Stream<UIError> get commentErrorStream => commentErrorStreamController.stream;


  @override
  Rx<String> errorStreamController = Rx("");
  @override
  Stream<String> get errorStream => errorStreamController.stream;

  RxBool isValidCommentStreamController = RxBool(false);
  @override
  Stream<bool> get isValidComment => isValidCommentStreamController.stream;

  GetxPostPresenter({
    required this.remoteLoadUser,
    required this.localGetUserId,
    required this.remoteLoadPublish,
    required this.remoteAddComment,
    required this.validation,
    required this.remoteLoadComments,
    required this.remoteLikePublish,
    required this.remoteUnlikePublish,
    required this.remoteDeleteComment,
  });

  String _commentContent = "";

  @override
  Stream<UserEntity> get currentUser {
    var userId = localGetUserId.getUserId();
    if (userId == null) {
      throw "Error!";
    }
    return remoteLoadUser.loadUserByUID(uid: userId);
  }

  @override
  Stream<PublishEntity> getPublishById({required String id}) => remoteLoadPublish.findPublishById(publishId: id);

  @override
  Stream<UserEntity> loadUserById({required String id}) {
    return remoteLoadUser.loadUserByUID(uid: id);
  }

  @override
  Future<void> addComment({required String publishId}) async {
    var userId = localGetUserId.getUserId();
    if (userId == null) throw "Error";
    try {
      await remoteAddComment.addComment(params: AddCommentParams(content: _commentContent, publishId: publishId, userId: userId));
      _commentContent = '';
      commentController.clear();
      _validateForm();
    } on FirebaseCloudFirestoreError catch (_) {
      rethrow;
    }
  }

  @override
  void validateComment(String content) {
    _commentContent = content;
    _validateField('comment_content');
    _validateForm();
  }

  void _validateForm() {
    final isValid = _commentContent.isNotEmpty && commentErrorStreamController.value == UIError.noError;
    isValidCommentStreamController.subject.add(isValid);
  }

  UIError _validateField(String field) {
    final formData = {
      'comment_content': _commentContent,
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
  Stream<List<CommentEntity>> comments({required String publishId}) {
    return remoteLoadComments.loadCommentsByPublishId(publishId: publishId);
  }

  @override
  Future<void> likeClick({required String publishId}) async {
    final publish = await remoteLoadPublish.findPublishById(publishId: publishId).first;
    final currentUser = await remoteLoadUser.loadUserByUID(uid: localGetUserId.getUserId() ?? "").first;
    final currentUserId = currentUser.uid;
    publish.uidOfWhoLikedIt.contains(currentUserId)
        ? await remoteUnlikePublish.unlikePublish(params: UnlikePublishParams(userId: currentUserId, publishId: publishId))
        : await remoteLikePublish.likePublish(params: LikePublishParams(userId: currentUserId, publishId: publishId));
  }

  TextEditingController commentController = TextEditingController();
  @override
  TextEditingController get commentTextFieldController => commentController;

  @override
  Future<void> deleteComment({required String commentId, required String publishId}) async {
    try {
      await remoteDeleteComment.deleteComment(params: DeleteCommentParams(commentId: commentId, publishId: publishId));
    } catch (_) {}
  }
}
