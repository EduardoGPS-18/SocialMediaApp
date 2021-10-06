import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';

class RemoteDeleteComment implements DeleteComment {
  FirebaseCloudFirestore firebaseCloudFirestore;

  RemoteDeleteComment({
    required this.firebaseCloudFirestore,
  });

  @override
  Future<void> deleteComment({required DeleteCommentParams params}) async {
    await firebaseCloudFirestore.getPublishesCollection().doc(params.publishId).collection('comments').doc(params.commentId).delete();
  }
}
