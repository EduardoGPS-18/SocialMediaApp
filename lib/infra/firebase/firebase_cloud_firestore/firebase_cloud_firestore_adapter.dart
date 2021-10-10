import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/firebase/firebase.dart';
import 'handler/handlers.dart';

class FirebaseCloudFirestoreAdapter with HandleUsersImpls, HandlePublishesImpl, HandleCommentsImpl implements FirebaseCloudFirestore {
  @override
  FirebaseFirestore firebaseFirestore;

  FirebaseCloudFirestoreAdapter({
    required this.firebaseFirestore,
  });
}
