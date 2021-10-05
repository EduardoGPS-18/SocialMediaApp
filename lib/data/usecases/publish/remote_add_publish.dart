import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteAddPublish implements AddPublish {
  FirebaseCloudFirestore firebaseCloudFirestore;

  RemoteAddPublish({
    required this.firebaseCloudFirestore,
  });

  @override
  Future<void> addPublish({required PublishEntity publish}) async {
    try {
      final response = await firebaseCloudFirestore
          .getCollection(
            collectionName: 'publishes',
          )
          .doc(publish.userId)
          .collection("publishes")
          .add(
            RemotePublishModel.fromEntity(publish).toMap(),
          );
      response.update({'uid': response.id});
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }
}
