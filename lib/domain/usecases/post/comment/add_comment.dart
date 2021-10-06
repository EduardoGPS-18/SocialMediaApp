abstract class AddComment {
  Future<void> addComment({required AddCommentParams params});
}

class AddCommentParams {
  final String content;
  final String publishId;
  final String userId;
  AddCommentParams({required this.content, required this.publishId, required this.userId});
}
