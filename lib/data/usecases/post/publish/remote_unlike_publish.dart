import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';

class RemoteUnlikePublish implements UnlikePublish {
  FirebaseCloudFirestore firebaseCloudFirestore;
  RemoteUnlikePublish({required this.firebaseCloudFirestore});

  @override
  Future<void> unlikePublish({required String userId, required String publishId}) async {
    final publish = firebaseCloudFirestore.getPublishesCollection().doc(publishId);
    final listLikes = List.from((await publish.get()).data()?["uidOfWhoLikedIt"] ?? []);
    listLikes.contains("userId") ? listLikes.removeWhere((user) => user == userId) : null;
    publish.update({
      "uidOfWhoLikedIt": [...listLikes]
    });
  }
}
