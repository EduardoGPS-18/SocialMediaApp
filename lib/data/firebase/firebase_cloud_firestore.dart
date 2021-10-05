import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseCloudFirestore {
  CollectionReference getCollection({required String collectionName});
  Future<void> setDataDocument({required String doc, required Object data});
  Stream<QuerySnapshot> getStreamCollection({required String collectionName});
  Future<CollectionReference> getCollectionReference({required String collectionPath});
  DocumentReference<Map<String, dynamic>> getPublishesByUserID({required String userId, required String publishId});
}
