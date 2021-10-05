import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteLoadPublishById implements LoadPublish {
  FirebaseCloudFirestore firebaseCloudFirestore;
  FirebaseAuthentication firebaseAuthentication;

  RemoteLoadPublishById({
    required this.firebaseCloudFirestore,
    required this.firebaseAuthentication,
  });

  @override
  Future<PublishEntity> findPublishById({required String publishId}) async {
    final response = await firebaseCloudFirestore.getCollection(collectionName: 'publishes').doc(publishId).get();

    return RemotePublishModel.fromMap(response.data() as Map<String, dynamic>).toEntity();
  }
}
