import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';

class RemoteLikePublish implements LikePublish {
  FirebaseCloudFirestore firebaseFirestore;

  RemoteLikePublish({
    required this.firebaseFirestore,
  });

  @override
  Future<void> likePublish({required LikePublishParams params}) async {
    final publish = firebaseFirestore.getPublishDocumentByUid(uid: params.publishId);
    final listLikes = (await publish.get()).data()?["uidOfWhoLikedIt"] ?? [];

    publish.update({
      'uidOfWhoLikedIt': [...listLikes, params.userId]
    });
  }
}
