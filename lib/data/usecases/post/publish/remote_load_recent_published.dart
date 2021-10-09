import '../../../../domain/entities/entities.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';
import '../../../models/models.dart';

class RemoteLoadRecentPublishes implements LoadRecentPublishes {
  FirebaseCloudFirestore firebaseCloudFirestore;

  RemoteLoadRecentPublishes({
    required this.firebaseCloudFirestore,
  });

  @override
  Stream<List<PublishEntity>> getPublishesByDate({required DateTime date}) {
    final publishes = firebaseCloudFirestore.getPublishesStream();
    var publishesStream = publishes.map((event) => event.docs.map((e) => RemotePublishModel.fromMap(e.data()).toEntity()).toList());

    return publishesStream.map((event) => event.where((element) => element.createdAt.isAfter(date)).toList());
  }
}
