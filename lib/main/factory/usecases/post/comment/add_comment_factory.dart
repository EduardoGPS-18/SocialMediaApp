import '../../../../../data/usecases/post/post.dart';
import '../../../../../domain/usecases/usecases.dart';
import '../../../factory.dart';

AddComment makeAddComment() => RemoteAddComment(
      firebaseCloudFirestore: makeFirebaseCloudFirestore(),
    );
