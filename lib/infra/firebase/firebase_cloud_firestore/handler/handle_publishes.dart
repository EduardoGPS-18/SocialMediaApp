import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../data/firebase/firebase.dart';
import '../../../../data/models/models.dart';
import '../../../../domain/entities/entities.dart';

mixin HandlePublishesImpl implements HandlePublishes {
  @override
  Future<List<PublishEntity>> getPublishes() async {
    final response = firebaseFirestore.collection('publishes');
    final json = await response.get();
    final publishList = json.docs.map((element) => RemotePublishModel.fromMap(element.data()).toEntity()).toList();

    for (var publish in publishList) {
      final response = await firebaseFirestore.collection("publishes").doc(publish.uid).collection('comments').get();

      final list = response.docs.map((e) => RemoteCommentModel.fromMap(e.data()).toEntity()).toList();

      publish.comments.addAll([...list]);
    }
    return publishList;
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
}
