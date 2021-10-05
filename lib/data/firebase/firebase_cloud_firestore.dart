import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/entities.dart';

abstract class FirebaseCloudFirestore {
  CollectionReference getCollection({required String collectionName});
  Future<void> setDataDocument({required String doc, required Object data});
  Stream<QuerySnapshot> getStreamCollection({required String collectionName});
  Future<CollectionReference> getCollectionReference({required String collectionPath});
  CollectionReference<Map<String, dynamic>> getPublishesCollectionRefByUserID({required String userId});
  DocumentReference<Map<String, dynamic>> getPublisheDocumentByUserIdAndPublishId({required String userId, required String publishId});
  Future<List<CommentEntity>> getCommentsByUserIdAndPublishId({required String userId, required String publishId});
  Future<List<String>> getUsersUID();
}
