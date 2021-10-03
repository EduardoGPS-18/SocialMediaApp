import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../firebase/firebase.dart';
import '../models/remote_save_user_model.dart';

class RemoteRegisterUser implements RegisterUser {
  FirebaseAuthentication firebaseAuthentication;
  FirebaseCloudFirestore cloudFirestore;

  RemoteRegisterUser({
    required this.firebaseAuthentication,
    required this.cloudFirestore,
  });

  @override
  Future<UserEntity> registerUserWithRegisterParams({required RegisterUserParams params}) async {
    final userCred = await firebaseAuthentication.registerUser(params: params);
    cloudFirestore.setDataDocument(
        doc: userCred.user?.uid ?? "",
        data: RemoteSaveUserModel(
          name: params.name,
          photoUrl: params.photoUrl,
          email: params.email,
        ).toMap());
    return UserEntity(name: params.name, email: params.email, photoUrl: params.photoUrl);
  }
}
