import '../../../entities/entities.dart';

abstract class LoadComments {
  Stream<List<CommentEntity>> loadCommentsByPublishId({required String publishId});
}
