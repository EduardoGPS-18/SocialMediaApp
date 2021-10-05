import '../../entities/entities.dart';

abstract class AddComment {
  Future<void> addComment({required CommentEntity comment});
}
