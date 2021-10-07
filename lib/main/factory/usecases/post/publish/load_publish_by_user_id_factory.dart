import '../../../../../data/usecases/post/post.dart';
import '../../../../../domain/usecases/usecases.dart';
import '../../../factory.dart';

LoadPublishesByUserID makeLoadPublishesByUserId() =>
    RemoteLoadPublishesByUserID(
      firebaseCloudFirestore: makeFirebaseCloudFirestore(),
    );
