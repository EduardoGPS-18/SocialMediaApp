import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';

class RemoteUnlikePublish implements UnlikePublish {
  FirebaseCloudFirestore firebaseCloudFirestore;
  RemoteUnlikePublish({required this.firebaseCloudFirestore});

  @override
  Future<void> unlikePublish({required UnlikePublishParams params}) async {
    try {
      final publish = firebaseCloudFirestore.getPublishesCollection().doc(params.publishId);
      final listLikes = List.from((await publish.get()).data()?["uidOfWhoLikedIt"] ?? []);

      listLikes.contains(params.userId) ? listLikes.removeWhere((user) => user == params.userId) : null;

      publish.update({
        "uidOfWhoLikedIt": [...listLikes]
      });
    } catch (_) {
      rethrow;
    }
  }
}
