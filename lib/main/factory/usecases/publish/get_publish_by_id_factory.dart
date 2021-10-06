import '../../../../data/usecases/publish/publish.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factory.dart';

LoadPublishesByUserID makeLoadPublishesByUserId() => RemoteLoadPublishesByUserID(
      firebaseCloudFirestore: makeFirebaseCloudFirestore(),
      firebaseAuthentication: makeFirebaseAuthentication(),
    );
