import '../firebase/firebase.dart';

import '../../domain/usecases/usecases.dart';

class LocalGetUserId implements GetUserId {
  FirebaseAuthentication firebaseAuthentication;

  LocalGetUserId({
    required this.firebaseAuthentication,
  });

  @override
  String? getUserId() {
    return firebaseAuthentication.getCurrentUserId();
  }
}
