import '../../../../domain/usecases/auth/auth.dart';

import '../../../../data/usecases/auth/logout.dart';
import '../../factory.dart';

Logout makeLogout() => RemoteLogout(firebaseAuthentication: makeFirebaseAuthentication());
