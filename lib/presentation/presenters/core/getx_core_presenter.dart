import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:get/get.dart';

import '../../../data/firebase/firebase.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';

class GetxCorePresenter extends GetxController implements CorePresenter {
  final AddComment remoteAddComment;
  final DeleteComment remoteDeleteComment;
  final AddPublish remoteAddPublish;
  final DeletePublish remoteDeletePublish;
  final LikePublish remoteLikePublish;
  final UnlikePublish remoteUnlikePublish;
  final LoadPublish remoteLoadPublish;
  final LoadPublishesByUserID remoteLoadPublishesByUserID;
  final LoadRecentPublishes remoteLoadRecentPublishes;
  final LoadUser remoteLoadUser;
  final GetUserId localGetUserId;

  String _userId = '';

  GetxCorePresenter({
    required this.localGetUserId,
    required this.remoteAddComment,
    required this.remoteDeleteComment,
    required this.remoteAddPublish,
    required this.remoteDeletePublish,
    required this.remoteLikePublish,
    required this.remoteUnlikePublish,
    required this.remoteLoadPublish,
    required this.remoteLoadPublishesByUserID,
    required this.remoteLoadRecentPublishes,
    required this.remoteLoadUser,
  });

  @override
  Future<void> addComment(String publishId, String content) async {
    if (content.isNotEmpty) {
      try {
        remoteAddComment.addComment(params: AddCommentParams(content: content, publishId: publishId, userId: _userId));
      } on FirebaseCloudFirestoreError catch (error) {
        handlingErrorsStreamController.addError(error.code);
      } catch (_) {
        handlingErrorsStreamController.subject.add("Ocorreu um erro!");
      }
    }
  }

  @override
  Future<void> addPublish(String content) async {
    if (content.isNotEmpty) {
      try {
        await remoteAddPublish.addPublish(params: AddPublishParams(content: content, userId: _userId));
      } on FirebaseCloudFirestoreError catch (error) {
        handlingErrorsStreamController.addError(error.code);
      } catch (_) {
        handlingErrorsStreamController.subject.add("Ocorreu um erro!");
      }
    }
  }

  @override
  Future<void> deleteComment(String publishId, String commentId) async {
    try {
      await remoteDeleteComment.deleteComment(params: DeleteCommentParams(publishId: publishId, commentId: commentId));
    } on FirebaseCloudFirestoreError catch (error) {
      handlingErrorsStreamController.addError(error.code);
    } catch (_) {
      handlingErrorsStreamController.subject.add("Ocorreu um erro!");
    }
  }

  @override
  Future<void> deletePublish(String publishId) async {
    try {} on FirebaseCloudFirestoreError catch (error) {
      handlingErrorsStreamController.addError(error.code);
    } catch (_) {
      handlingErrorsStreamController.subject.add("Ocorreu um erro!");
    }
  }

  @override
  Future<void> likePublish(String publishId) async {
    try {
      await remoteLikePublish.likePublish(params: LikePublishParams(userId: _userId, publishId: publishId));
    } on FirebaseCloudFirestoreError catch (error) {
      handlingErrorsStreamController.addError(error.code);
    } catch (_) {
      handlingErrorsStreamController.subject.add("Ocorreu um erro!");
    }
  }

  @override
  Future<void> unlikePublish(String publishId) async {
    try {
      await remoteUnlikePublish.unlikePublish(params: UnlikePublishParams(userId: _userId, publishId: publishId));
    } on FirebaseCloudFirestoreError catch (error) {
      handlingErrorsStreamController.addError(error.code);
    } catch (_) {
      handlingErrorsStreamController.subject.add("Ocorreu um erro!");
    }
  }

  Rx<List<PublishEntity>> loadPublishesByUserIDController = Rx<List<PublishEntity>>([]);
  @override
  Stream<List<PublishEntity>> get loadPublishesByUserID => loadPublishesByUserIDController.stream;

  Rx<List<PublishEntity>> loadRecentPublishesController = Rx<List<PublishEntity>>([]);
  @override
  Stream<List<PublishEntity>> get loadRecentPublishes => loadRecentPublishesController.stream;

  Rx<UserEntity> loadUserDataController = const UserEntity(uid: '', email: '', name: '', photoUrl: '').obs;
  @override
  Stream<UserEntity> get loadUserData => loadUserDataController.stream;

  Rx<String> handlingErrorsStreamController = Rx<String>("");
  @override
  Stream<String> get handlingError => handlingErrorsStreamController.stream;

  @override
  void updateUserId() {
    _userId = localGetUserId.getUserId() ?? '';
  }

  ValueNotifier<int> pageIndexNofifierController = ValueNotifier<int>(0);
  @override
  ValueNotifier<int> get pageIndexNotifier => pageIndexNofifierController;
}
