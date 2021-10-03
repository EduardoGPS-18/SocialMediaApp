import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/firebase/firebase.dart';

class FirebaseCloudFirestoreAdapter implements FirebaseCloudFirestore {
  FirebaseFirestore firestore;
  FirebaseCloudFirestoreAdapter({
    required this.firestore,
  });
  @override
  CollectionReference getCollection({required String collectionName}) {
    CollectionReference collection = firestore.collection(collectionName);
    return collection;
  }

  @override
  Stream<QuerySnapshot<Object?>> getStreamCollection({required String collectionName}) {
    // TODO: implement getStreamCollection
    throw UnimplementedError();
  }
}
