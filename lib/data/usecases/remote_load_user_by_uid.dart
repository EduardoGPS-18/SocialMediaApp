import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/load_user_by_uid.dart';
import '../firebase/firebase.dart';

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
    final userMap = response.data() as Map<String, dynamic>;
    return UserEntity(
      name: userMap['name'],
      photoUrl: userMap["photoUrl"],
      email: userMap["email"],
    );
  }
}
