import 'package:firebase_storage/firebase_storage.dart';

import '../../data/firebase/firebase_store/firebase_store.dart';

class FirestoreStorageAdapter implements FirebaseStore {
  FirebaseStorage firebaseStorage;

  FirestoreStorageAdapter({
    required this.firebaseStorage,
  });

  @override
  Future<String> saveImageOfPath({required SaveImageParams params}) async {
    var a = firebaseStorage.ref().child("user_images/${params.path}/").putFile(params.file);
    return a.snapshot.ref.fullPath;
  }
}
