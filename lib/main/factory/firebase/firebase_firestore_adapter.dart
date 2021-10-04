import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/firebase/firebase.dart';
import '../../../infra/firebase/firebase.dart';

FirebaseCloudFirestore makeFirebaseCloudFirestore() => FirebaseCloudFirestoreAdapter(
      firebaseFirestore: FirebaseFirestore.instance,
    );
