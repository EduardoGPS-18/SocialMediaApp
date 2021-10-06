import 'package:social_media_app/data/firebase/firebase.dart';
import 'package:social_media_app/domain/usecases/usecases.dart';



class RemoteLikePublish implements LikePublish {
  FirebaseCloudFirestore firebaseFirestore;

  RemoteLikePublish({
    required this.firebaseFirestore,
  });

  @override
  Future<void> likePublish({required String userId, required String publishId}) async {
    final publish = firebaseFirestore.getPublishDocumentByUid(uid: publishId);
    final listLikes = (await publish.get()).data()?["uidOfWhoLikedIt"] ?? [];

    publish.update({
      'uidOfWhoLikedIt': [...listLikes, userId]
    });
  }
}
