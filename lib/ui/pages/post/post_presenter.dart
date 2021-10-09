import '../../../domain/entities/entities.dart';
import '../../helpers/errors/errors.dart';

abstract class PostPresenter {
  Stream<UIError> get errorStream;
  Stream<bool> get isValidComment;

  Stream<List<CommentEntity>> comments({required String publishId});

  Stream<UserEntity> get currentUser;

  void validateComment(String comment);
  Future<void> likeClick({required String publishId});
  Stream<PublishEntity> getPublishById({required String id});
  Stream<UserEntity> loadUserById({required String id});
  Future<void> addComment({required String publishId});
}
