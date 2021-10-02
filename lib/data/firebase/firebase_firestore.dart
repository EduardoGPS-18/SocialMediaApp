import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CloudFirestore {
  CollectionReference getCollection({required String collectionName});
  Stream<QuerySnapshot> getStreamCollection({required String collectionName});
}
