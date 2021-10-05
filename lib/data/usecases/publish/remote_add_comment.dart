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
    final response = firebaseCloudFirestore.getPublishesByUserID(userId: comment.userId, publishId: comment.publishId);
    final data = (await response.get()).data();

    if (data == null) return;

    final comments = data["comments"];

    response.update({
      "comments": [...comments, RemoteCommentModel.fromEntity(comment).toMap()]
    });
  }
}
