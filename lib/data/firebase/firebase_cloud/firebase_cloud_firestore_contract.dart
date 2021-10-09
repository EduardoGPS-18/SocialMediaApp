import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/entities.dart';

abstract class FirebaseCloudFirestore implements HandlePublishes, HandleComments, HandleUsers {}

abstract class HandleUsers {
  FirebaseFirestore get firebaseFirestore;
  CollectionReference<Map<String, dynamic>> getUserCollections();
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserById({String? id});
}

abstract class HandlePublishes {
  FirebaseFirestore get firebaseFirestore;
  Future<List<PublishEntity>> getPublishes();
  Stream<QuerySnapshot<Map<String, dynamic>>> getPublishesStream();
  CollectionReference<Map<String, dynamic>> getPublishesCollection();
  Future<List<PublishEntity>> getPublishesByUserID({required String userId});
  DocumentReference<Map<String, dynamic>> getPublishDocumentByUid({required String uid});
}

abstract class HandleComments {
  FirebaseFirestore get firebaseFirestore;
  Future<List<CommentEntity>> getCommentsByPublishId({required String publishId});
  Stream<QuerySnapshot<Map<String, dynamic>>> getCommentsStreamByPublishId({required String publishId});
}
