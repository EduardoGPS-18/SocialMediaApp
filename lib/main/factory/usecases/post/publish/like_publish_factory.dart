import '../../../../../data/usecases/post/post.dart';
import '../../../../../domain/usecases/post/publish/publish.dart';
import '../../../factory.dart';

LikePublish makeLikePublish() => RemoteLikePublish(
      firebaseFirestore: makeFirebaseCloudFirestore(),
    );
