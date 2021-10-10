import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/firebase/firebase.dart';
import '../../../domain/usecases/usecases.dart';

class FirebaseAuthenticationAdapter implements FirebaseAuthentication {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthenticationAdapter({
    required this.firebaseAuth,
  });

  @override
  Future<UserCredential> loginWithEmailAndPassword(
      {required LoginUserParams params}) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: params.email, password: params.password);

      return userCredential;
    } on FirebaseAuthException catch (error) {
      if (error.code == FirebaseAuthenticationError.invalidEmail.code) {
        throw FirebaseAuthenticationError.invalidEmail;
      } else if (error.code == FirebaseAuthenticationError.userDisabled.code) {
        throw FirebaseAuthenticationError.userDisabled;
      } else if (error.code == FirebaseAuthenticationError.userNotFound.code) {
        throw FirebaseAuthenticationError.userNotFound;
      } else if (error.code == FirebaseAuthenticationError.wrongPassword.code) {
        throw FirebaseAuthenticationError.wrongPassword;
      } else {
        throw FirebaseAuthenticationError.internalError;
      }
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserCredential> registerUser(
      {required RegisterUserParams params}) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: params.email, password: params.password);
      return userCredential;
    } on FirebaseAuthException catch (error) {
      if (error.code == FirebaseAuthenticationError.emailAlreadyInUse.code) {
        throw FirebaseAuthenticationError.emailAlreadyInUse;
      } else if (error.code == FirebaseAuthenticationError.userDisabled.code) {
        throw FirebaseAuthenticationError.userDisabled;
      } else if (error.code == FirebaseAuthenticationError.userNotFound.code) {
        throw FirebaseAuthenticationError.userNotFound;
      } else if (error.code == FirebaseAuthenticationError.wrongPassword.code) {
        throw FirebaseAuthenticationError.wrongPassword;
      } else {
        throw FirebaseAuthenticationError.internalError;
      }
    }
  }

  @override
  String? getCurrentUserId() {
    return firebaseAuth.currentUser?.uid;
  }
}
