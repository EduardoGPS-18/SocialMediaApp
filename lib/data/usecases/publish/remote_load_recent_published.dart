import '../../firebase/firebase.dart';
import '../../models/models.dart';
import '../../../domain/entities/publish_entity.dart';

import '../../../domain/usecases/usecases.dart';

class RemoteLoadRecentPublishes implements LoadRecentPublishes {
  FirebaseCloudFirestore firebaseCloudFirestore;
  FirebaseAuthentication firebaseAuthentication;

  RemoteLoadRecentPublishes({
    required this.firebaseCloudFirestore,
    required this.firebaseAuthentication,
  });

  @override
  Future<List<PublishEntity>> getPublishesByDate(
      {required DateTime date}) async {
    final response = await firebaseCloudFirestore
        .getCollection(collectionName: 'publishes')
        .where('createdAt', isLessThan: date)
        .limit(20)
        .orderBy('createdAt', descending: true)
        .get();

    final List<PublishEntity> publishes = response.docs.map((document) {
      final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      return RemotePublishModel.fromMap(data).toEntity();
    }).toList();

    return publishes;
  }
}
