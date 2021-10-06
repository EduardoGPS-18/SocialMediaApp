abstract class LikePublish {
  Future<void> likePublish({required LikePublishParams params});
}

class LikePublishParams {
  final String userId;
  final String publishId;

  LikePublishParams({required this.userId, required this.publishId});
}
