abstract class UnlikePublish {
  Future<void> unlikePublish({required UlikePublishParams params});
}

class UlikePublishParams {
  final String userId;
  final String publishId;

  UlikePublishParams({required this.userId, required this.publishId});
}
