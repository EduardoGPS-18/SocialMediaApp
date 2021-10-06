import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../data/firebase/firebase.dart';

mixin HandleUsersImpls implements HandleUsers {
  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserById({String? id}) async {
    return await getUserCollections().doc(id).get();
  }

  @override
  CollectionReference<Map<String, dynamic>> getUserCollections() {
    return firebaseFirestore.collection('users');
  }
}
