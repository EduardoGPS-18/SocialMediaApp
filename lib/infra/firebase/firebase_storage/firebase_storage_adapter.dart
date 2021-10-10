import 'package:firebase_storage/firebase_storage.dart';

import '../../../data/firebase/firebase_store/firebase_store_contract.dart';

class FirestoreStorageAdapter implements FirebaseStore {
  FirebaseStorage firebaseStorage;

  FirestoreStorageAdapter({
    required this.firebaseStorage,
  });

  @override
  Future<String> saveImageOfPath({required SaveImageParams params}) async {
    try {
      var a = await firebaseStorage.ref().child("user_images/${params.path}/").putFile(params.file);

      return await a.ref.getDownloadURL();
    } catch (_) {
      rethrow;
    }
  }
}
