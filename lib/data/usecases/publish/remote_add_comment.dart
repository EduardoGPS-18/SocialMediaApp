import '../../models/models.dart';
import '../../firebase/firebase.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

class RemoteAddComment implements AddComment {
  FirebaseCloudFirestore firebaseCloudFirestore;
  FirebaseAuthentication firebaseAuthentication;

  RemoteAddComment({
    required this.firebaseCloudFirestore,
    required this.firebaseAuthentication,
  });

  @override
  Future<void> addComment({required CommentEntity comment}) async {
    final response = await firebaseCloudFirestore
        .getCollection(collectionName: 'publishes')
        .doc(comment.publishId)
        .set({'comments': RemoteCommentModel.fromEntity(comment).toMap()});
  }
}
