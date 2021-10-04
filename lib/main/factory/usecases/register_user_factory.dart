import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factory.dart';

RegisterUser makeRegisterUser() => RemoteRegisterUser(
      firebaseAuthentication: makeFirebaseAuthentication(),
      cloudFirestore: makeFirebaseCloudFirestore(),
    );
