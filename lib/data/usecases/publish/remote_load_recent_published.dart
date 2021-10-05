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
    final publishesCollection = await firebaseCloudFirestore.getCollection(collectionName: 'publishes').get();

    return [];
  }
}

// final usersUidList = await firebaseCloudFirestore.getUsersUID();
//     final List<PublishEntity> publishEntities = [];

//     for (var element in usersUidList) {
//       final currentUser = await publishesCollection.doc(element).get();
//       if (currentUser.data() == null) break;
//       print(currentUser.data());
//       publishEntities.add(RemotePublishModel.fromMap(currentUser.data() as Map<String, dynamic>).toEntity());
//     }