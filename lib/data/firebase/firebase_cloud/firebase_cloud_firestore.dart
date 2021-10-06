import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/entities.dart';

abstract class FirebaseCloudFirestore {
  CollectionReference getCollection({required String collectionName});
  Future<void> setDataDocument({required String doc, required Object data});
  Stream<QuerySnapshot> getStreamCollection({required String collectionName});
  Future<CollectionReference> getCollectionReference({required String collectionPath});

  Future<List<PublishEntity>> getPublishes();
  CollectionReference<Map<String, dynamic>> getPublishesCollection();
  Future<List<PublishEntity>> getPublishesByUserID({required String userId});
  DocumentReference<Map<String, dynamic>> getPublishDocumentByUid({required String uid});

  Future<List<CommentEntity>> getCommentsByPublishId({required String publishId});
}
