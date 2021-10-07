import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factory.dart';

GetUserId makeLocalGetUserId() => LocalGetUserId(
      firebaseAuthentication: makeFirebaseAuthentication(),
    );
