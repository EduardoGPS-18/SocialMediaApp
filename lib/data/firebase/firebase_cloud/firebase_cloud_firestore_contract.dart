import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/entities.dart';

abstract class FirebaseCloudFirestore implements HandlePublishes, HandleComments, HandleUsers {}

abstract class HandleUsers {
  FirebaseFirestore get firebaseFirestore;
  CollectionReference<Map<String, dynamic>> getUserCollections();
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserById({String? id});
}

abstract class HandlePublishes {
  FirebaseFirestore get firebaseFirestore;
  Future<List<PublishEntity>> getPublishes();
  CollectionReference<Map<String, dynamic>> getPublishesCollection();
  Future<List<PublishEntity>> getPublishesByUserID({required String userId});
  DocumentReference<Map<String, dynamic>> getPublishDocumentByUid({required String uid});
}

abstract class HandleComments {
  FirebaseFirestore get firebaseFirestore;
  Future<List<CommentEntity>> getCommentsByPublishId({required String publishId});
}
