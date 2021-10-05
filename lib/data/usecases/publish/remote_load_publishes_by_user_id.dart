import '../../../domain/entities/publish_entity.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteLoadPublishesByUserID implements LoadPublishesByUserID {
  FirebaseCloudFirestore firebaseCloudFirestore;
  FirebaseAuthentication firebaseAuthentication;

  RemoteLoadPublishesByUserID({
    required this.firebaseCloudFirestore,
    required this.firebaseAuthentication,
  });

  @override
  Future<List<PublishEntity>> getPublishesByUserID({required String userId}) async {
    final response = firebaseCloudFirestore.getPublishesCollectionRefByUserID(userId: userId);

    final publishes = await response.get();

    final list = publishes.docs.map((element) => RemotePublishModel.fromMap(element.data()).toEntity()).toList();
    return list;
  }
}
