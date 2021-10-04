import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factory.dart';

LoginUser makeLoginUser() => RemoteLoginUser(
      firebaseAuthentication: makeFirebaseAuthentication(),
      cloudFirestore: makeFirebaseCloudFirestore(),
    );
