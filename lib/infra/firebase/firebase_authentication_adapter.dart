import 'package:firebase_auth/firebase_auth.dart';

import '../../data/firebase/firebase.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';

class FirebaseAuthenticationAdapter implements FirebaseAuthentication {
  @override
  Future<UserCredential> loginWithEmailAndPassword({required LoginUserParams params}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> registerUser({required RegisterUserParams params}) async {
    throw UnimplementedError();
  }
}
