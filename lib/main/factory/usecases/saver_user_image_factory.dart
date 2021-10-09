import '../../../data/usecases/remote_save_user_image.dart';
import '../../../domain/usecases/usecases.dart';
import '../factory.dart';

SaveUserImage makeSaveUserImage() => RemoteSaveUserImage(
      cloudFirestore: makeFirebaseCloudFirestore(),
      firebaseStore: makeFirebaseStore(),
    );
