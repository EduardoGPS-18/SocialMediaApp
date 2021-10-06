import '../../../../../data/usecases/post/post.dart';
import '../../../../../domain/usecases/usecases.dart';
import '../../../factory.dart';

AddPublish makeAddPublish() => RemoteAddPublish(
      firebaseCloudFirestore: makeFirebaseCloudFirestore(),
    );
