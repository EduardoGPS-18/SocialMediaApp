import '../../../../domain/entities/entities.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';
import '../../../models/models.dart';

class RemoteLoadPublishById implements LoadPublish {
  FirebaseCloudFirestore firebaseCloudFirestore;

  RemoteLoadPublishById({
    required this.firebaseCloudFirestore,
  });

  @override
  Stream<PublishEntity> findPublishById({required String publishId}) {
    try {
      final response = firebaseCloudFirestore.getPublishesCollection().doc(publishId).snapshots();
      final stream = response.map((event) => RemotePublishModel.fromMap(event.data() ?? {}).toEntity());

      return stream;
    } catch (_) {
      rethrow;
    }
  }
}
