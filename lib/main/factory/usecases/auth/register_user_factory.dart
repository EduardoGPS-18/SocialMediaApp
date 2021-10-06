import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factory.dart';
import '../../firebase/firebase_store_adapter.dart';

RegisterUser makeRegisterUser() => RemoteRegisterUser(
      firebaseAuthentication: makeFirebaseAuthentication(),
      cloudFirestore: makeFirebaseCloudFirestore(),
      firebaseStore: makeFirebaseStore(),
    );
