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
  Stream<UserEntity> loadUserByUID({required String uid}) {
    try {
      final response = firebaseCloudFirestore.getUserById(id: uid);
      final userStream = response.map((event) => RemoteUserModel.fromMap(event.data() ?? {}).toEntity());
      return userStream;
    } catch (_) {
      rethrow;
    }
  }
}
