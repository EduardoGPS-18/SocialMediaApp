import '../../../../../data/usecases/post/post.dart';
import '../../../../../domain/usecases/usecases.dart';
import '../../../factory.dart';

LoadPublish makeLoadPublishByID() => RemoteLoadPublishById(
      firebaseCloudFirestore: makeFirebaseCloudFirestore(),
    );
