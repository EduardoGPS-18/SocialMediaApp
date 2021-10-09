import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../data/firebase/firebase.dart';
import '../../../../data/models/models.dart';
import '../../../../domain/entities/entities.dart';

mixin HandleCommentsImpl implements HandleComments {
  @override
  Future<List<CommentEntity>> getCommentsByPublishId({required String publishId}) async {
    final response = await firebaseFirestore.collection("publishes").doc(publishId).collection('comments').get();

    final list = response.docs.map((e) => RemoteCommentModel.fromMap(e.data()).toEntity()).toList();
    return list;
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getCommentsStreamByPublishId({required String publishId}) {
    final response = firebaseFirestore.collection("publishes").doc(publishId).collection('comments').snapshots();
    return response;
  }
}
