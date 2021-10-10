import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../data/firebase/firebase.dart';

mixin HandleUsersImpls implements HandleUsers {
  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserById({String? id})  {
    return getUserCollections().doc(id).snapshots();
  }

  @override
  CollectionReference<Map<String, dynamic>> getUserCollections() {
    return firebaseFirestore.collection('users');
  }
}
