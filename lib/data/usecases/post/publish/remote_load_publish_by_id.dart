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
  Future<PublishEntity> findPublishById({required String publishId}) async {
    final response = await firebaseCloudFirestore.getPublishesCollection().doc(publishId).get();

    return RemotePublishModel.fromMap(response.data() as Map<String, dynamic>).toEntity();
  }
}
