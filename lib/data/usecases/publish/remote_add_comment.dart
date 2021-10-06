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
    var commentList = await firebaseCloudFirestore.getCommentsByPublishId(publishId: comment.publishId);

    final resp = await firebaseCloudFirestore.getPublishesCollection().where('uid', isEqualTo: comment.publishId).get();
    final field = firebaseCloudFirestore.getPublishesCollection().doc(resp.docs.first.data()["uid"]);
    field.update({
      "comments": [
        ...commentList.map((e) => RemoteCommentModel.fromEntity(e).toMap()),
        RemoteCommentModel.fromEntity(comment).setUid("'${commentList.length}'").toMap()
      ]
    });
  }
}
