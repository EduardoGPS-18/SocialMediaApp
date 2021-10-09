import '../../../domain/entities/entities.dart';
import '../../helpers/errors/errors.dart';

abstract class PostPresenter {
  void validateComment(String comment);

  Stream<UIError> get errorStream;
  Stream<bool> get isValidComment;
  Stream<UserEntity> get currentUser;
  Stream<List<CommentEntity>> comments({required String publishId});
  Stream<PublishEntity> getPublishById({required String id});
  Stream<UserEntity> loadUserById({required String id});

  Future<void> deleteComment({required String commentId, required String publishId});
  Future<void> likeClick({required String publishId});
  Future<void> addComment({required String publishId});
}
