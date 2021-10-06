import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/firebase/firebase.dart';
import '../../data/models/models.dart';
import '../../domain/entities/comment_entity.dart';
import '../../domain/entities/entities.dart';

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
  Future<List<PublishEntity>> getPublishes() async {
    final response = firebaseFirestore.collection('publishes');
    final json = await response.get();
    final listPublishes = json.docs.map((element) => RemotePublishModel.fromMap(element.data()).toEntity()).toList();
    return listPublishes;
  }

  @override
  Future<List<PublishEntity>> getPublishesByUserID({required String userId}) async {
    final response = await firebaseFirestore.collection('publishes').get();

    final matches = response.docs.where((element) => element.data()["userId"] == userId).toList();

    return matches.map((e) => RemotePublishModel.fromMap(e.data()).toEntity()).toList();
  }

  @override
  CollectionReference<Map<String, dynamic>> getPublishesCollection() {
    return firebaseFirestore.collection("publishes");
  }

  @override
  DocumentReference<Map<String, dynamic>> getPublishDocumentByUid({required String uid}) {
    return firebaseFirestore.collection("publishes").doc(uid);
  }

  @override
  Future<List<CommentEntity>> getCommentsByPublishId({required String publishId}) async {
    final response = await getPublishDocumentByUid(uid: publishId).get();

    final list = List.from(response.data()?["comments"] ?? []).map((e) => RemoteCommentModel.fromMap(e).toEntity()).toList();
    return list;
  }
}
