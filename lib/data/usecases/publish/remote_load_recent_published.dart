import '../../../domain/entities/publish_entity.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';

class RemoteLoadRecentPublishes implements LoadRecentPublishes {
  FirebaseCloudFirestore firebaseCloudFirestore;
  FirebaseAuthentication firebaseAuthentication;

  RemoteLoadRecentPublishes({
    required this.firebaseCloudFirestore,
    required this.firebaseAuthentication,
  });

  @override
  Future<List<PublishEntity>> getPublishesByDate({required DateTime date}) async {
    final publishes = await firebaseCloudFirestore.getPublishes();
    return publishes.where((element) => element.createdAt.isBefore(element.createdAt)).toList();
  }
}
