import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';

class RemoteDeletePublish implements DeletePublish {
  FirebaseCloudFirestore firebaseCloudFirestore;
  RemoteDeletePublish({
    required this.firebaseCloudFirestore,
  });
  @override
  Future<void> deletePublish({required String publishId}) async {
    try {
      await firebaseCloudFirestore.getPublishesCollection().doc(publishId).delete();
    } catch (e) {
      rethrow;
    }
  }
}
