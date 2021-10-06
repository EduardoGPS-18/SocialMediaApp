import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteLoginUser implements LoginUser {
  FirebaseAuthentication firebaseAuthentication;
  FirebaseCloudFirestore cloudFirestore;

  RemoteLoginUser({
    required this.firebaseAuthentication,
    required this.cloudFirestore,
  });

  @override
  Future<UserEntity> loginUserWithEmailAndPassword({required LoginUserParams params}) async {
    try {
      final userCred = await firebaseAuthentication.loginWithEmailAndPassword(params: params);
      final user = await cloudFirestore.getUserById(id: userCred.user?.uid);

      final userData = user.data() as Map<String, dynamic>;
      userData["uid"] = userCred.user!.uid;
      return RemoteUserModel.fromMap(userData).toEntity();
    } on FirebaseAuthenticationError catch (_) {
      rethrow;
    }
  }
}
