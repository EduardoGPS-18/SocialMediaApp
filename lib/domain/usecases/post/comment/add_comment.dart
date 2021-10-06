import '../../../entities/comment_entity.dart';

abstract class AddComment {
  Future<void> addComment({required CommentEntity comment});
}
