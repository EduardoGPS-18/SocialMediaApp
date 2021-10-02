import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseCloudFirestore {
  CollectionReference getCollection({required String collectionName});
  Stream<QuerySnapshot> getStreamCollection({required String collectionName});
}
