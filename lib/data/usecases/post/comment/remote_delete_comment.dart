import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';

class RemoteDeleteComment implements DeleteComment {
  FirebaseCloudFirestore firebaseCloudFirestore;

  RemoteDeleteComment({
    required this.firebaseCloudFirestore,
  });

  @override
  Future<void> deleteComment({required DeleteCommentParams params}) async {
    try {
      final publishDocument = firebaseCloudFirestore.getPublishesCollection().doc(params.publishId);
      final data = await publishDocument.get();
      await publishDocument.update({"commentsCount": (data.data()?["commentsCount"] - 1)});
      await publishDocument.collection('comments').doc(params.commentId).delete();
    } catch (_) {
      rethrow;
    }
  }
}
