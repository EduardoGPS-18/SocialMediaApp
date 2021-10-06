import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';
import '../../../models/models.dart';

class RemoteAddComment implements AddComment {
  FirebaseCloudFirestore firebaseCloudFirestore;

  RemoteAddComment({
    required this.firebaseCloudFirestore,
  });

  @override
  Future<void> addComment({required AddCommentParams params}) async {
    final resp = await firebaseCloudFirestore.getPublishesCollection().where('uid', isEqualTo: params.publishId).get();
    final field = firebaseCloudFirestore.getPublishesCollection().doc(resp.docs.first.data()["uid"]);
    final currentCommentCol = field.collection("comments");
    final info = await currentCommentCol.add(RemoteCommentModel.toSave(content: params.content, publishId: params.publishId, userId: params.userId).toMap());
    await info.update({"uid": info.id});
  }
}
