import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../firebase/firebase.dart';
import '../models/models.dart';

class RemoteLoginUser implements LoginUser {
  FirebaseAuthentication firebaseAuthentication;
  FirebaseCloudFirestore cloudFirestore;

  RemoteLoginUser({
    required this.firebaseAuthentication,
    required this.cloudFirestore,
  });

  @override
  Future<UserEntity> loginUserWithEmailAndPassword({required LoginUserParams params}) async {
    final userCred = await firebaseAuthentication.loginWithEmailAndPassword(params: params);
    final user = await cloudFirestore.getCollection(collectionName: 'users').doc(userCred.user?.uid).get();
    return RemoteUserModel.fromMap(user.data() as Map<String, dynamic>);
  }
}
