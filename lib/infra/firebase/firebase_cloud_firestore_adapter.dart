import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/firebase/firebase.dart';
import '../../data/models/models.dart';
import '../../domain/entities/comment_entity.dart';

class FirebaseCloudFirestoreAdapter implements FirebaseCloudFirestore {
  FirebaseFirestore firebaseFirestore;
  FirebaseCloudFirestoreAdapter({
    required this.firebaseFirestore,
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
      return firebaseFirestore.collection(collectionName);
    } catch (_) {
      throw FirebaseCloudFirestoreError.internalError;
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> getStreamCollection({required String collectionName}) {
    throw UnimplementedError();
  }

  @override
  Future<CollectionReference> getCollectionReference({required String collectionPath}) async {
    CollectionReference reference = firebaseFirestore.collection(collectionPath);
    return reference;
  }

  @override
  CollectionReference<Map<String, dynamic>> getPublishesCollectionRefByUserID({required String userId}) {
    return firebaseFirestore.collection('publishes').doc(userId).collection('publishes');
  }

  @override
  DocumentReference<Map<String, dynamic>> getPublisheDocumentByUserIdAndPublishId({required String userId, required String publishId}) {
    return getPublishesCollectionRefByUserID(userId: userId).doc(publishId);
  }

  @override
  Future<List<CommentEntity>> getCommentsByUserIdAndPublishId({required String userId, required String publishId}) async {
    final response = await getPublishesCollectionRefByUserID(userId: userId).get();
    final list = response.docs.where((element) => element["uid"] == publishId).map((e) => e.data()["comments"]).toList();
    list.removeWhere((element) => element == null);
    return List.from(list.first).map((e) => RemoteCommentModel.fromMap(e).toEntity()).toList();
  }

  @override
  Future<List<String>> getUsersUID() async {
    final response = await firebaseFirestore.collection('users').get();
    final List<String> list = response.docs.map((e) => e.data()["uid"] as String).toList();

    return list;
  }
}
