import '../../domain/usecases/usecases.dart';
import '../firebase/firebase.dart';

class RemoteLoginUser implements LoginUser {
  FirebaseAuthentication firebaseAuthentication;

  RemoteLoginUser({
    required this.firebaseAuthentication,
  });

  @override
  Future<void> loginUserWithEmailAndPassword({required LoginUserParams params}) async {
    firebaseAuthentication.loginWithEmailAndPassword(params: params);
  }
}
