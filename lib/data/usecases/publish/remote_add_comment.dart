import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteAddComment implements AddComment {
  FirebaseCloudFirestore firebaseCloudFirestore;
  FirebaseAuthentication firebaseAuthentication;

  RemoteAddComment({
    required this.firebaseCloudFirestore,
    required this.firebaseAuthentication,
  });

  @override
  Future<void> addComment({required CommentEntity comment}) async {
    var commentList = await firebaseCloudFirestore.getCommentsByUserIdAndPublishId(userId: comment.userId, publishId: comment.publishId);

    final resp = firebaseCloudFirestore.getPublisheDocumentByUserIdAndPublishId(userId: comment.userId, publishId: comment.publishId);

    resp.update({
      "comments": [
        ...commentList.map((e) => RemoteCommentModel.fromEntity(e).toMap()),
        RemoteCommentModel.fromEntity(comment).setUid("'${commentList.length}'").toMap()
      ]
    });
  }
}
