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
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: params.email, password: params.password);
    return userCredential;
  }
}
