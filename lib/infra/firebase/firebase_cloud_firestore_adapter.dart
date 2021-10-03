import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/firebase/firebase.dart';

class FirebaseCloudFirestoreAdapter implements FirebaseCloudFirestore {
  FirebaseFirestore firestore;
  FirebaseCloudFirestoreAdapter({
    required this.firestore,
  });

  @override
  Future<void> setDataDocument({required String doc, required Object data}) async {
    await getCollection(collectionName: "users").doc(doc).set(data);
  }

  @override
  CollectionReference getCollection({required String collectionName}) {
    CollectionReference collection = firestore.collection(collectionName);
    return collection;
  }

  @override
  Stream<QuerySnapshot<Object?>> getStreamCollection({required String collectionName}) {
    throw UnimplementedError();
  }
}
