abstract class UnlikePublish {
  Future<void> unlikePublish({required UnlikePublishParams params});
}

class UnlikePublishParams {
  final String userId;
  final String publishId;

  UnlikePublishParams({required this.userId, required this.publishId});
}
