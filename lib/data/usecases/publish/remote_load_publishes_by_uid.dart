import '../../firebase/firebase.dart';
import '../../models/models.dart';
import '../../../domain/entities/publish_entity.dart';

import '../../../domain/usecases/usecases.dart';

class RemoteLoadPublishesByUID implements LoadPublishesByUID {
  FirebaseCloudFirestore firebaseCloudFirestore;
  FirebaseAuthentication firebaseAuthentication;

  RemoteLoadPublishesByUID({
    required this.firebaseCloudFirestore,
    required this.firebaseAuthentication,
  });

  @override
  Future<List<PublishEntity>> getPublishesByUID({required String uid}) async {
    final response = await firebaseCloudFirestore
        .getCollection(collectionName: 'publishes')
        .where('uid', isEqualTo: uid)
        .get();

    final List<PublishEntity> publishes = response.docs.map((document) {
      final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      return RemotePublishModel.fromMap(data).toEntity();
    }).toList();

    return publishes;
  }
}
