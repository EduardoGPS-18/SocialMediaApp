import '../../../helpers/helpers.dart';
import '../../../../../../domain/entities/entities.dart';

abstract class FeedPresenter {
  Stream<UserEntity> loadUserEntityById({required String uid});
  Stream<UserEntity> get user;
  Stream<List<PublishEntity>> get publishStream;
  Stream<bool> get isValidPublish;
  Stream<UIError> get errorStream;

  Future<void> addPublish();

  void likeClick({required String publishId});
  void validPublishContent(String value);
}
