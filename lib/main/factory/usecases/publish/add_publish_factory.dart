import '../../../../data/usecases/publish/publish.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factory.dart';

AddPublish makeAddPublish() => RemoteAddPublish(firebaseCloudFirestore: makeFirebaseCloudFirestore());
