import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factory.dart';

LoadUser makeLoadUser() => RemoteLoadUser(
      firebaseCloudFirestore: makeFirebaseCloudFirestore(),
      firebaseAuthentication: makeFirebaseAuthentication(),
    );
