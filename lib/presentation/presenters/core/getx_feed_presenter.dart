import 'package:get/get.dart';

import '../../../domain/entities/publish_entity.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth/auth.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/helpers/helpers.dart';
import '../../../ui/pages/pages.dart';

class GetxFeedPresenter extends GetxController implements FeedPresenter {
  LoadUser loadUser;
  GetUserId getUser;
  LoadRecentPublishes loadRecentPublishes;
  LikePublish likePublish;
  UnlikePublish unlikePublish;
  LoadPublish loadPublish;
  DeletePublish deletePublish;

  Rx<String> userCommunicateStreamController = Rx("");
  @override
  Stream<String> get userCommunicateStream => userCommunicateStreamController.stream;
  Rx<List<PublishEntity>> publishStreamController = Rx([]);

  @override
  Stream<List<PublishEntity>> get publishStream => loadRecentPublishes.getPublishesByDate(date: DateTime.now().subtract(const Duration(days: 7)));

  GetxFeedPresenter({
    required this.loadUser,
    required this.getUser,
    required this.loadRecentPublishes,
    required this.likePublish,
    required this.unlikePublish,
    required this.loadPublish,
    required this.deletePublish,
  });

  @override
  Stream<UserEntity> get user => loadUser.loadUserByUID(uid: getUser.getUserId() ?? "");

  @override
  Stream<UserEntity> loadUserEntityById({required String uid}) => loadUser.loadUserByUID(uid: uid);

  @override
  void likeClick({required String publishId}) async {
    final publish = await loadPublish.findPublishById(publishId: publishId).first;
    final currentUser = await (user).first;
    final currentUserId = currentUser.uid;
    publish.uidOfWhoLikedIt.contains(currentUserId)
        ? await unlikePublish.unlikePublish(params: UnlikePublishParams(userId: currentUserId, publishId: publishId))
        : await likePublish.likePublish(params: LikePublishParams(userId: currentUserId, publishId: publishId));
  }

  @override
  Future<void> removePublish({required String publishId}) async {
    try {
      await deletePublish.deletePublish(publishId: publishId);
      userCommunicateStreamController.subject.add(R.string.successOnDelete);
    } catch (_) {}
  }
}
