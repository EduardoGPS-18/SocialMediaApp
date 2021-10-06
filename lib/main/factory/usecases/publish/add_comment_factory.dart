import '../../../../data/usecases/publish/publish.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factory.dart';

AddComment makeAddComment() => RemoteAddComment(
      firebaseCloudFirestore: makeFirebaseCloudFirestore(),
      firebaseAuthentication: makeFirebaseAuthentication(),
    );
