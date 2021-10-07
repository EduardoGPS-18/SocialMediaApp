import '../../../../../data/usecases/usecases.dart';
import '../../../../../domain/usecases/post/publish/publish.dart';
import '../../../firebase/firebase.dart';

UnlikePublish makeUnlikePublish() => RemoteUnlikePublish(
      firebaseCloudFirestore: makeFirebaseCloudFirestore(),
    );
