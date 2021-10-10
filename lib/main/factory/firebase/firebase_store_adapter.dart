import 'package:firebase_storage/firebase_storage.dart';

import '../../../data/firebase/firebase.dart';
import '../../../infra/firebase/firebase.dart';

FirebaseStore makeFirebaseStore() => FirestoreStorageAdapter(
      firebaseStorage: FirebaseStorage.instance,
    );
