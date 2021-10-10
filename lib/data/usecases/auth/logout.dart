import '../../../domain/usecases/auth/logout.dart';
import '../../firebase/firebase.dart';

class RemoteLogout implements Logout {
  FirebaseAuthentication firebaseAuthentication;
  RemoteLogout({
    required this.firebaseAuthentication,
  });

  @override
  Future<void> logout() async {
    await firebaseAuthentication.logout();
  }
}
