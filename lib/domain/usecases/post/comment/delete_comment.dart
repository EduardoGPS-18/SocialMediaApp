abstract class DeleteComment {
  Future<void> deleteComment({required DeleteCommentParams params});
}

class DeleteCommentParams {
  final String commentId;
  final String publishId;

  DeleteCommentParams({
    required this.commentId,
    required this.publishId,
  });
}
