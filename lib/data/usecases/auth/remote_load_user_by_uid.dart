import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/auth/auth.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteLoadUser implements LoadUser {
  FirebaseCloudFirestore firebaseCloudFirestore;
  FirebaseAuthentication firebaseAuthentication;

  RemoteLoadUser({
    required this.firebaseCloudFirestore,
    required this.firebaseAuthentication,
  });

  @override
  Future<UserEntity> loadUserByUID({required String uid}) async {
    final response = await firebaseCloudFirestore.getCollection(collectionName: 'users').doc(uid).get();
    final userData = response.data() as Map<String, dynamic>;
    userData["uid"] = uid;
    return RemoteUserModel.fromMap(userData).toEntity();
  }
}
