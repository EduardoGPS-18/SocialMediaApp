import 'dart:io';
import '../../domain/usecases/usecases.dart';
import '../firebase/firebase.dart';

class RemoteSaveUserImage implements SaveUserImage {
  FirebaseStore firebaseStore;
  FirebaseCloudFirestore cloudFirestore;

  RemoteSaveUserImage({
    required this.cloudFirestore,
    required this.firebaseStore,
  });

  @override
  Future<String> saveUserImage({
    required String userId,
    required File userImage,
  }) async {
    try {
      final photoUrl = await firebaseStore.saveImageOfPath(
          params: SaveImageParams(path: userId, file: userImage));

      return photoUrl;
    } on FirebaseCloudFirestoreError catch (_) {
      rethrow;
    }
  }
}
