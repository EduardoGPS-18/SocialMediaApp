import 'package:firebase_storage/firebase_storage.dart';

import '../../data/firebase/firebase_store.dart';

class FirestoreStorageAdapter implements FirebaseStore {
  FirebaseStorage firebaseStorage;

  FirestoreStorageAdapter({
    required this.firebaseStorage,
  });

  @override
  Future<String> saveImageOfPath({required SaveImageParams params}) async {
    var a = firebaseStorage.ref(params.path).putFile(params.file);
    return  a.snapshot.ref.fullPath;
  }
}
