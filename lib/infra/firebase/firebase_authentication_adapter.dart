import 'package:firebase_auth/firebase_auth.dart';

import '../../data/firebase/firebase.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';

class FirebaseAuthenticationAdapter implements FirebaseAuthentication {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthenticationAdapter({
    required this.firebaseAuth,
  });

  @override
  Future<UserCredential> loginWithEmailAndPassword({required LoginUserParams params}) async {
    final userCredential = firebaseAuth.signInWithEmailAndPassword(email: params.email, password: params.password);
    return userCredential;
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserCredential> registerUser({required RegisterUserParams params}) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: params.email, password: params.password);
    return userCredential;
    } on FirebaseAuthException catch (error) {
      if (error.code == FirebaseAuthError.invalidEmail.code) {
        throw FirebaseAuthError.invalidEmail;
      } else if (error.code == FirebaseAuthError.userDisabled.code) {
        throw FirebaseAuthError.userDisabled;
      } else if (error.code == FirebaseAuthError.userNotFound.code) {
        throw FirebaseAuthError.userNotFound;
      } else if (error.code == FirebaseAuthError.wrongPassword.code) {
        throw FirebaseAuthError.wrongPassword;
      } else {
        throw FirebaseAuthError.internalError;
      }
    }
  }
}
