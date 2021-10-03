import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/firebase/firebase.dart';

class FirebaseCloudFirestoreAdapter implements FirebaseCloudFirestore {
  FirebaseFirestore firestore;
  FirebaseCloudFirestoreAdapter({
    required this.firestore,
  });

  @override
  Future<void> setDataDocument({required String doc, required Object data}) async {
    try {
      await getCollection(collectionName: "users").doc(doc).set(data);
    } catch (_) {
      throw FirebaseCloudFirestoreError.internalError;
    }
  }

  @override
  CollectionReference getCollection({required String collectionName}) {
    try {
      return firestore.collection(collectionName);
    } catch (_) {
      throw FirebaseCloudFirestoreError.internalError;
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> getStreamCollection({required String collectionName}) {
    throw UnimplementedError();
  }
}
