import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../firebase/firebase.dart';
import '../models/models.dart';

class RemoteRegisterUser implements RegisterUser {
  FirebaseAuthentication firebaseAuthentication;
  FirebaseCloudFirestore cloudFirestore;
  FirebaseStore firebaseStore;

  RemoteRegisterUser({
    required this.firebaseAuthentication,
    required this.cloudFirestore,
    required this.firebaseStore,
  });

  @override
  Future<UserEntity> registerUserWithRegisterParams({required RegisterUserParams params}) async {
    try {
      final userCred = await firebaseAuthentication.registerUser(params: params);
      var photoUrl = await firebaseStore.saveImageOfPath(params: SaveImageParams(path: userCred.user?.uid ?? "", file: params.userImage));
      cloudFirestore.setDataDocument(
        doc: userCred.user?.uid ?? "",
        data: RemoteUserModel(
          name: params.name,
          photoUrl: photoUrl,
          email: params.email,
        ).toMap(),
      );
      return UserEntity(
        name: params.name,
        email: params.email,
        photoUrl: photoUrl,
      );
    } on FirebaseAuthenticationError catch (_) {
      rethrow;
    }
  }
}
