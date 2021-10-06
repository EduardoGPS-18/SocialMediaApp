import '../../../../domain/entities/entities.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';

class RemoteLoadPublishesByUserID implements LoadPublishesByUserID {
  FirebaseCloudFirestore firebaseCloudFirestore;

  RemoteLoadPublishesByUserID({
    required this.firebaseCloudFirestore,
  });

  @override
  Future<List<PublishEntity>> getPublishesByUserID({required String userId}) async {
    final response = await firebaseCloudFirestore.getPublishes();
    final publishes = response.where((element) => element.userId == userId).toList();

    return publishes;
  }
}
