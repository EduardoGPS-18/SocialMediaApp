import '../../../../domain/entities/entities.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';
import '../../../models/models.dart';

class RemoteLoadPublishesByUserID implements LoadPublishesByUserID {
  FirebaseCloudFirestore firebaseCloudFirestore;

  RemoteLoadPublishesByUserID({
    required this.firebaseCloudFirestore,
  });

  @override
  Stream<List<PublishEntity>> getPublishesByUserID({required String userId}) {
    final response = firebaseCloudFirestore.getPublishesCollection().where('userId', isEqualTo: userId).snapshots();

    return response.map((event) => event.docs.map((e) => RemotePublishModel.fromMap(e.data()).toEntity()).toList());
  }
}
