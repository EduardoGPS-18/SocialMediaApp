import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';
import '../../../models/models.dart';

class RemoteAddPublish implements AddPublish {
  FirebaseCloudFirestore firebaseCloudFirestore;

  RemoteAddPublish({
    required this.firebaseCloudFirestore,
  });

  @override
  Future<void> addPublish({required AddPublishParams params}) async {
    try {
      final response = await firebaseCloudFirestore.getPublishesCollection().add(
            RemotePublishModel.toSave(content: params.content, userId: params.userId).toMap(),
          );
      response.update({'uid': response.id});
    } catch (_) {
      rethrow;
    }
  }
}
