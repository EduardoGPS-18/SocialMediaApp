import '../../../domain/entities/publish_entity.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';

class RemoteLoadPublishesByUserID implements LoadPublishesByUserID {
  FirebaseCloudFirestore firebaseCloudFirestore;
  FirebaseAuthentication firebaseAuthentication;

  RemoteLoadPublishesByUserID({
    required this.firebaseCloudFirestore,
    required this.firebaseAuthentication,
  });

  @override
  Future<List<PublishEntity>> getPublishesByUserID({required String userId}) async {
    final response = await firebaseCloudFirestore.getPublishes();
    final publishes = response.where((element) => element.userId == userId).toList();

    return publishes;
  }
}
