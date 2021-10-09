import '../../../../../../domain/entities/entities.dart';

abstract class FeedPresenter {
  Stream<UserEntity> loadUserEntityById({required String uid});
  void likeClick({required String publishId});
  Stream<UserEntity> get user;
  Stream<List<PublishEntity>> get publishStream;
}
