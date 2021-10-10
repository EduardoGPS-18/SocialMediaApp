import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';

class LocalGetUserId implements GetUserId {
  FirebaseAuthentication firebaseAuthentication;

  LocalGetUserId({
    required this.firebaseAuthentication,
  });

  @override
  String? getUserId() {
    try {
      return firebaseAuthentication.getCurrentUserId();
    } catch (_) {
      rethrow;
    }
  }
}
