import '../../../../../data/usecases/usecases.dart';
import '../../../../../domain/usecases/usecases.dart';
import '../../../firebase/firebase.dart';

DeletePublish makeDeletePublish() => RemoteDeletePublish(
      firebaseCloudFirestore: makeFirebaseCloudFirestore(),
    );
