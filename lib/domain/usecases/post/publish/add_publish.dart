abstract class AddPublish {
  Future<void> addPublish({required AddPublishParams params});
}

class AddPublishParams {
  final String content;
  final String userId;
  AddPublishParams({required this.content, required this.userId});
}
