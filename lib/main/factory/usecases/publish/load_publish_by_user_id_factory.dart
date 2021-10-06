import '../../../../data/usecases/publish/publish.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factory.dart';

LoadPublish makeLoadPublishesByUserID() => RemoteLoadPublishById(
      firebaseCloudFirestore: makeFirebaseCloudFirestore(),
      firebaseAuthentication: makeFirebaseAuthentication(),
    );
