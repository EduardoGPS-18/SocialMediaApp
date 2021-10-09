import '../../../../domain/entities/entities.dart';
import '../../../../domain/usecases/post/comment/comment.dart';
import '../../../firebase/firebase.dart';
import '../../../models/models.dart';

class RemoteLoadComments implements LoadComments {
  FirebaseCloudFirestore firebaseCloudFirestore;
  RemoteLoadComments({
    required this.firebaseCloudFirestore,
  });
  @override
  Stream<List<CommentEntity>> loadCommentsByPublishId({required String publishId}) {
    try {
      final commentsStream = firebaseCloudFirestore.getCommentsStreamByPublishId(publishId: publishId);
      final commentList = commentsStream.map((event) => event.docs.map((e) => RemoteCommentModel.fromMap(e.data()).toEntity()).toList());
      return commentList;
    } catch (_) {
      rethrow;
    }
  }
}
