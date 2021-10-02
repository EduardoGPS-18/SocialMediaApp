import '../../domain/usecases/usecases.dart';
import '../firebase/firebase.dart';

class RemoteRegisterUser implements RegisterUser {
  FirebaseAuthentication firebaseAuthentication;
  FirebaseCloudFirestore cloudFirestore;

  RemoteRegisterUser({
    required this.firebaseAuthentication,
    required this.cloudFirestore,
  });

  @override
  Future<void> registerUserWithRegisterParams({required RegisterUserParams params}) async {
    firebaseAuthentication.registerUser(params: params);
  }
}
