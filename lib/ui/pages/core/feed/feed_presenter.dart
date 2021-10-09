import '../../../../../../domain/entities/entities.dart';

abstract class FeedPresenter {
  Stream<UserEntity> loadUserEntityById({required String uid});
  void likeClick({required String publishId});
  Future<void> removePublish({required String publishId});

  Stream<String>get userCommunicateStream;
  Stream<UserEntity> get user;
  Stream<List<PublishEntity>> get publishStream;
}
