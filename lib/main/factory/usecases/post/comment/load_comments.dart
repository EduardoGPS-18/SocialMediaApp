import '../../../../../data/usecases/post/comment/comment.dart';
import '../../../../../domain/usecases/post/comment/comment.dart';
import '../../../firebase/firebase.dart';

LoadComments makeLoadComments() => RemoteLoadComments(firebaseCloudFirestore: makeFirebaseCloudFirestore());
