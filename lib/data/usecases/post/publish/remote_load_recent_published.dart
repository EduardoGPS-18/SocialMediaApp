import '../../../../domain/entities/entities.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';

class RemoteLoadRecentPublishes implements LoadRecentPublishes {
  FirebaseCloudFirestore firebaseCloudFirestore;

  RemoteLoadRecentPublishes({
    required this.firebaseCloudFirestore,
  });

  @override
  Future<List<PublishEntity>> getPublishesByDate({required DateTime date}) async {
    final publishes = await firebaseCloudFirestore.getPublishes();
    return publishes.where((element) => element.createdAt.isAfter(date)).toList();
  }
}
