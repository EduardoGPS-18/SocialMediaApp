import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/domain/usecases/usecases.dart';

abstract class FirebaseAuthentication {
  Future<UserCredential> loginWithEmailAndPassword({required LoginUserParams params});
  Future<UserCredential> registerUser({required RegisterUserParams params});
  Future<void> logout();
}
