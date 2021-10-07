import '../../../../../../domain/entities/entities.dart';

abstract class FeedPresenter {
  Future<UserEntity> loadUserEntityById({required String uid});
  void likeImage({required String publishId});
  Future<UserEntity> get user;
  Stream<List<PublishEntity>> get publishStream;
}
